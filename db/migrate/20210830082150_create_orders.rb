class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :order_number
      t.integer :quantity
      t.decimal :rate
      t.integer :discount
      t.decimal :amount
      t.datetime :fullfillment_date
      t.string :comments
      t.boolean :gift, :null => false, :default => false
      t.boolean :active, :null => false, :default => true

      t.timestamps
    end
  end
end
