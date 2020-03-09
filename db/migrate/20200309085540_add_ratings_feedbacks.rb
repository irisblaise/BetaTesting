class AddRatingsFeedbacks < ActiveRecord::Migration[5.2]
  def change
    add_column :feedbacks, :website_ux, :integer
    add_column :feedbacks, :website_ui, :integer
    add_column :feedbacks, :website_design, :integer
    add_column :feedbacks, :website_fluidity, :integer
    add_column :feedbacks, :website_latency, :integer
  end
end
