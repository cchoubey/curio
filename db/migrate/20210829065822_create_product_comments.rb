class CreateProductComments < ActiveRecord::Migration[6.1]
  def change
    create_table :product_comments do |t|

      t.timestamps
    end
  end
end
