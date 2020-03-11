class Tester < ApplicationRecord
  has_one_attached :photo

  belongs_to :user, dependent: :destroy

  has_many :feedbacks
  has_many :reviews, through: :feedbacks

  enum education: EDUCATION_LEVELS
  enum profession: PROFESSION
  enum nationality: NATIONALITY
  enum sex: SEX


  def avg_rating
    self.reviews.average(:rating).to_f.round(2)
  end
  # validates :education, presence: true
  # validates :age, presence: true
  # validates :profession, presence: true
  # validates :nationality, presence: true
  # validates :sex, presence:

  def total_money
    self
  end

end
