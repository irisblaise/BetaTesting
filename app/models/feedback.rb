class Feedback < ApplicationRecord
  belongs_to :startup
  belongs_to :tester
  has_many :questions
  has_many :answers, through: :questions
end
