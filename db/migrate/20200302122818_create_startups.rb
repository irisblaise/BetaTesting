class CreateStartups < ActiveRecord::Migration[5.2]
  def change
    create_table :startups do |t|
      t.string :company_name
      t.string :url
      t.string :description
      t.integer :sector
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
