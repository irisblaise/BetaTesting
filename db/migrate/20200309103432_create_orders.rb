class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :state
      t.monetize :amount, currency: { present: false }
      t.integer :quantity
      t.string :checkout_session_id
      t.references :startup, foreign_key: true
      t.references :version, foreign_key: true
      t.timestamps
    end
  end
end
