class Startup < ApplicationRecord
  #searchkick
  has_one_attached :photo
  belongs_to :user
  has_many :feedbacks
  has_many :versions, dependent: :destroy

  enum sector: SECTOR


  #methods for targetmarket selecting
  def self.by_tester_age(age)
    where("'#{age}' = ANY (target_age)")
  end

    def self.by_tester_profession(profession)
    where("'#{profession}' = ANY (target_profession)")
  end

    def self.by_tester_rating(rating)
    where("'#{rating}' = ANY (target_rating)")
  end

    def self.by_tester_nationality(nationality)
    where("'#{nationality}' = ANY (target_nationality)")
  end

    def self.by_tester_sex(sex)
    where("'#{sex}' = ANY (target_sex)")
  end

    def self.by_tester_education(education)
    where("'#{education}' = ANY (target_eduction)")
  end
end

  # validates :company_name, presence: true, uniqueness: true
  # validates :url, presence: true, uniqueness: true
  # validates :description, presence: true
  # validates :sector, presence: true
