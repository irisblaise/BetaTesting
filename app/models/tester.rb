class Tester < ApplicationRecord
  belongs_to :user, dependent: :destroy

  enum education: EDUCATION_LEVELS
  enum profession: PROFESSION
  enum nationality: NATIONALITY
  enum sex: SEX


  # validates :education, presence: true
  # validates :age, presence: true
  # validates :profession, presence: true
  # validates :nationality, presence: true
  # validates :sex, presence: true
end
