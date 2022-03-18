class CreateBrands < ActiveRecord::Migration[6.1]
  def change
    create_table :brands do |t|
      t.string :brand_name
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
