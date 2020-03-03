class AddForeignKeyQuestions < ActiveRecord::Migration[5.2]
  def change
    add_reference :questions, :version, foreign_key: true
  end
end
