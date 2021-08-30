class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.string :brand
      t.integer :stock
      t.boolean :active, :null => false, :default => true

      t.timestamps
    end
  end
end
