class RenameColumnUserType < ActiveRecord::Migration[6.1]
  def change
    rename_column :user_types, :type, :client_type
  end
end
