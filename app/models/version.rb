class Version < ApplicationRecord
  belongs_to :startup
  has_many :questions
  has_many :feedbacks
  has_many :testers, through: :feedbacks
end
