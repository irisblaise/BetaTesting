class CreateFeedbacks < ActiveRecord::Migration[5.2]
  def change
    create_table :feedbacks do |t|
      t.references :startup, foreign_key: true
      t.references :tester, foreign_key: true

      t.timestamps
    end
  end
end
