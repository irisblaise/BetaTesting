class Startup < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  has_many :feedbacks

  enum sector: SECTOR

  # validates :company_name, presence: true, uniqueness: true
  # validates :url, presence: true, uniqueness: true
  # validates :description, presence: true
  # validates :sector, presence: true

end
