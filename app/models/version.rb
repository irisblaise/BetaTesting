class Version < ApplicationRecord
  belongs_to :startup
  has_many :questions, dependent: :destroy
  has_many :feedbacks, dependent: :destroy
  has_many :testers, through: :feedbacks

  has_one :order

  validates :iframe, presence: true

  QUESTION_TYPES = %i[website_ux website_ui website_design website_fluidity website_latency].freeze

  before_destroy :remove_foreign_key_from_order
  after_create :check_iframe_connection

  def remove_foreign_key_from_order
    order.update version_id: nil
  end

  def self.current_price
    20
  end

  def calculate_avg_score
    score = {}

    QUESTION_TYPES.each do |question|
      sum_all = feedbacks.map{|feedback| feedback[question.to_sym]}.sum
      count_all = feedbacks.map{|feedback| feedback[question.to_sym]}.count

      if count_all == 0
        score[question] = 0
      else
        score[question] = sum_all.to_f/count_all
      end
    end
    score.to_json
  end

  def total_calculate_avg_score

    score = JSON.parse(calculate_avg_score)
    (score.values.sum/score.count).round(2)
  end

  def check_iframe_connection
    response = HTTParty.get(self.iframe)
    self.update iframe_connection: response.headers['x-frame-options'].nil?
  end
end
