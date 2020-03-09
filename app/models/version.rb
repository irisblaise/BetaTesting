class Version < ApplicationRecord
  belongs_to :startup
  has_many :questions
  monetize :price_cents
  has_many :feedbacks

  def self.current_price
    20
  end
end
