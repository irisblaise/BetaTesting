class Version < ApplicationRecord
  belongs_to :startup

  has_many :questions, dependent: :destroy
  has_many :feedbacks, dependent: :destroy
  has_one :order, dependent: :destroy

  def self.current_price
    20
  end
end
