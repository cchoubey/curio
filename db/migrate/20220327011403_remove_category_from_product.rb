class RemoveCategoryFromProduct < ActiveRecord::Migration[6.1]
  def change
    remove_foreign_key :products, :categories
    remove_column :products, :category_id
  end
end
