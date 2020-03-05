class Version < ApplicationRecord
  belongs_to :startup
  has_many :questions
  has_many :feedbacks
end
