class AddUserTypeToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :user_type_id, :integer
    add_index :users, :user_type_id
    add_reference :users, :user_type, null: false, foreign_key: true
  end
end
