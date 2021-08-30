class CreateOrderStatuses < ActiveRecord::Migration[6.1]
  def change
    create_table :order_statuses do |t|
      t.string :name
      t.boolean :active, :null => false, :default => true

      t.timestamps
    end
  end
end
