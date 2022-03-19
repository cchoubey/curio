class AddActiveFlagBrands < ActiveRecord::Migration[6.1]
  def change
    add_column :brands, :active, :boolean, :null => false, :default => true
  end
end
