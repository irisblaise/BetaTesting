class AddTargetGroupsToStartUp < ActiveRecord::Migration[5.2]
  def change
  add_column :startups, :target_eduction, :integer
  add_column :startups, :target_age, :integer
  add_column :startups, :target_profession, :integer
  add_column :startups, :target_rating, :integer
  add_column :startups, :target_nationality, :integer
  add_column :startups, :target_sex, :integer
  end
end
