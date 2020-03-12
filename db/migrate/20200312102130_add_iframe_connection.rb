class AddIframeConnection < ActiveRecord::Migration[5.2]
  def change
    add_column :versions, :iframe_connection, :boolean
  end
end
