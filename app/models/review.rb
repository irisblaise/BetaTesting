class Review < ApplicationRecord
  belongs_to :tester
  belongs_to :startup

  validates :rating, presence: true
end
