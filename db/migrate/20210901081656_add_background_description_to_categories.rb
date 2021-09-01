class AddBackgroundDescriptionToCategories < ActiveRecord::Migration[6.1]
  def change
    add_column :categories, :background, :string, :null => false, :default => '#0489b7'
    add_column :categories, :description, :string
  end
end
