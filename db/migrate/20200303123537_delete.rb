class Delete < ActiveRecord::Migration[5.2]
  def change
    remove_column :feedbacks, :startup_id
    add_reference :answers, :feedback, foreign_key: true
    add_reference :feedbacks, :version, foreign_key: true
  end
end
