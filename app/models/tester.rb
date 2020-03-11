class Tester < ApplicationRecord
  has_one_attached :photo

  belongs_to :user, dependent: :destroy

  enum education: EDUCATION_LEVELS
  enum profession: PROFESSION
  enum nationality: NATIONALITY
  enum sex: SEX


  def avg_rating
    # grab all reviews that belong to tester
    # pluck the review value
    # calc the avg
  end
  # validates :education, presence: true
  # validates :age, presence: true
  # validates :profession, presence: true
  # validates :nationality, presence: true
  # validates :sex, presence: true
end
