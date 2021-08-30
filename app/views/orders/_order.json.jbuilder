json.extract! order, :id, :order_number, :quantity, :rate, :discount, :amount, :fullfillment_date, :comments, :gift, :active, :created_at, :updated_at
json.url order_url(order, format: :json)
