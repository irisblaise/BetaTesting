class AddIframeUrl < ActiveRecord::Migration[5.2]
  def change
    add_column :versions, :iframe, :string
  end
end
