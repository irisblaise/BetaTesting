class UpdateIframe < ActiveRecord::Migration[5.2]
  def change
    rename_column :versions, :iframe, :iframe_url
  end
end
