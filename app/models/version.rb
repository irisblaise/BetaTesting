class Version < ApplicationRecord
  belongs_to :startup
  has_many :questions, dependent: :destroy
  has_many :feedbacks, dependent: :destroy
  has_many :testers, through: :feedbacks

  has_one :order

  before_destroy :remove_foreign_key_from_order

  def self.current_price
    20
  end

  def remove_foreign_key_from_order
    order.update version_id: nil
  end
end
