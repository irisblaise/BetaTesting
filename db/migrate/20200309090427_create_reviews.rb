class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.references :tester, foreign_key: true
      t.references :startup, foreign_key: true


      t.timestamps
    end

    remove_column :testers, :rating, :integer
  end
end
