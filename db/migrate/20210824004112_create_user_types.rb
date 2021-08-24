class CreateUserTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :user_types do |t|
      t.string :type
      t.integer :metric, :null => false, :default => 1

      t.timestamps
    end
  end
end
