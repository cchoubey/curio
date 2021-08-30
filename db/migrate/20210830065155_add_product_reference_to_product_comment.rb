class AddProductReferenceToProductComment < ActiveRecord::Migration[6.1]
  def change
    add_reference :product_comments, :product, null: false, foreign_key: true
  end
end
