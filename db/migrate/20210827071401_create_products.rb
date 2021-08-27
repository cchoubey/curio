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
    #add_reference :users, :user_type, null: false, foreign_key: true
    #add_reference :categories, :category, null: false, foreign_key: true
  end
end
