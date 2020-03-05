class Question < ApplicationRecord
  belongs_to :version
  has_many :answers
end
