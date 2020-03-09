class Version < ApplicationRecord
  belongs_to :startup
  has_many :questions
  monetize :price_cents

  def self.current_price
    20
  end
end
