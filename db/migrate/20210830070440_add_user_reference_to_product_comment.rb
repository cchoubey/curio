class AddUserReferenceToProductComment < ActiveRecord::Migration[6.1]
  def change
    add_reference :product_comments, :user, null: false, foreign_key: true
  end
end
