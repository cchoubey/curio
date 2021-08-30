class CreateProductComment < ActiveRecord::Migration[6.1]
  def change
    create_table :product_comments do |t|
      t.string :comment
      t.boolean :active, :null => false, :default => true

      t.timestamps
    end
  end
end
