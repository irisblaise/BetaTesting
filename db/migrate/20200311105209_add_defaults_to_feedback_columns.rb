class AddDefaultsToFeedbackColumns < ActiveRecord::Migration[5.2]
  def change
    # do the below when creating a new column
    # add_column :table, :column, :type, default: 0, nil: 0
    change_column :feedbacks, :website_ux, :integer, default: 0, nil: 0
    change_column :feedbacks, :website_ux, :integer, default: 0, nil: 0
    change_column :feedbacks, :website_ux, :integer, default: 0, nil: 0
    change_column :feedbacks, :website_ux, :integer, default: 0, nil: 0
    change_column :feedbacks, :website_ux, :integer, default: 0, nil: 0
  end
end
