class AddTargetGroupsToStartUp < ActiveRecord::Migration[5.2]
  def change
  add_column :startups, :target_education, :text, array:true, default: [], nil: []
  add_column :startups, :target_age, :text, array:true, default: [], nil: []
  add_column :startups, :target_profession, :text, array:true, default: [], nil: []
  add_column :startups, :target_rating, :text, array:true, default: [], nil: []
  add_column :startups, :target_nationality, :text, array:true, default: [], nil: []
  add_column :startups, :target_sex, :text, array:true, default: [], nil: []
  end
end
