class Feedback < ApplicationRecord
  belongs_to :version
  belongs_to :tester

  has_many :questions
  has_many :answers, through: :questions
end
