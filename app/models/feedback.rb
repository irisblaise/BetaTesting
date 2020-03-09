class Feedback < ApplicationRecord
  belongs_to :version
  belongs_to :tester

  has_many :questions, through: :version
  has_many :answers
  has_one :review
end
