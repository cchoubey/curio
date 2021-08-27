class AddActiveToCategory < ActiveRecord::Migration[6.1]
  def change
    add_column :categories, :active, :boolean, :null => false, :default => true
  end
end
