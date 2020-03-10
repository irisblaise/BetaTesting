class Review < ApplicationRecord
  belongs_to :feedback
  belongs_to :startup

  validates :rating, presence: true
end
