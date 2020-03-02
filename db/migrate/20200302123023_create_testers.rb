class CreateTesters < ActiveRecord::Migration[5.2]
  def change
    create_table :testers do |t|
      t.references :user, foreign_key: true
      t.integer :education
      t.integer :age
      t.integer :profession
      t.integer :sex
      t.integer :rating
      t.integer :nationality
      t.integer :account_balance
      t.timestamps
    end
  end
end
