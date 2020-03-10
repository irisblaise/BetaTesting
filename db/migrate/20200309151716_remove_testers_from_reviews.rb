class RemoveTestersFromReviews < ActiveRecord::Migration[5.2]
  def change
    remove_reference :reviews, :tester
    add_reference :reviews, :feedback
  end
end
