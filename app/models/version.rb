class Version < ApplicationRecord
  belongs_to :startup
  has_many :questions
  has_many :feedbacks
  has_many :testers, through: :feedbacks
  has_one :order

  def self.current_price
    20
  end

end
