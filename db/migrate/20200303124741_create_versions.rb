class CreateVersions < ActiveRecord::Migration[5.2]
  def change
    create_table :versions do |t|
      t.references :startup, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
