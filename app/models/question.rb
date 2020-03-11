class Question < ApplicationRecord
  belongs_to :version
  has_many :answers, dependent: :destroy

  # belongs_to :tester through: [:answer, :feedback]
end
