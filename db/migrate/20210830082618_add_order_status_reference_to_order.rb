class AddOrderStatusReferenceToOrder < ActiveRecord::Migration[6.1]
  def change
    add_reference :orders, :order_status, null: false, foreign_key: true
  end
end
