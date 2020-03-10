class Version < ApplicationRecord
  belongs_to :startup
  has_many :questions
  has_many :feedbacks
  has_many :testers, through: :feedbacks
  has_one :order

  QUESTION_TYPES = %i[website_ux website_ui website_design website_fluidity website_latency].freeze


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
        score[question] = sum_all/count_all
      end
    end

    score.to_json
  end

  # def calulate_avg_score_ui
  #   sum_all = feedbacks.map{|feedback| feedback.website_ui}.sum
  #   count_all = feedbacks.map{|feedback| feedback.website_ui}.count

  #   if count_all == 0
  #     average_ui = 0
  #   else
  #     average_ui = sum_all/count_all
  #   end
  # end
end
