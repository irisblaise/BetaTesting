class Version < ApplicationRecord
  belongs_to :startup
  has_many :questions
  has_many :feedbacks

  # def average_rating
  #   self.feedbacks
  # end
end
