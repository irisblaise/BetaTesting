class Startup < ApplicationRecord
  #searchkick
  has_one_attached :photo
  belongs_to :user
  has_many :feedbacks
  has_many :versions, dependent: :destroy
  enum target_education: EDUCATION_LEVELS
  enum target_profession: PROFESSION
  enum target_nationality: NATIONALITY
  enum target_sex: SEX


  enum sector: SECTOR

  # validates :company_name, presence: true, uniqueness: true
  # validates :url, presence: true, uniqueness: true
  # validates :description, presence: true
  # validates :sector, presence: true

end
