class RemoveFeedbackFromQuestion < ActiveRecord::Migration[5.2]
  def change
    remove_column :questions, :feedback_id
  end
end
