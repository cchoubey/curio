class Order < ApplicationRecord
    belongs_to :product
    has_one :order_status
    belongs_to :user
    scope :current, -> { where(active: true).order('LOWER(order_number)') }
end
