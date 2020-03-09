class AddQuantityToVersion < ActiveRecord::Migration[5.2]
  def change
    add_column :versions, :quantity, :integer

  end
end
