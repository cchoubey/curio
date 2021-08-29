class CreateProductImage < ActiveRecord::Migration[6.1]
  def change
    create_table :product_images do |t|
      t.string :image_path
      t.boolean :active, :null => false, :default => true

      t.timestamps
    end
  end
end
