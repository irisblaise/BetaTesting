class Version < ApplicationRecord
  belongs_to :startup
  has_many :questions
  monetize :price_cents

end
