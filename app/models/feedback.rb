class Feedback < ApplicationRecord
  belongs_to :startup
  belongs_to :tester
end
