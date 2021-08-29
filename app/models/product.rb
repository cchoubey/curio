class Product < ApplicationRecord
    belongs_to :category
    #belongs_to :user
    has_many :product_images
    has_many :product_comments
    scope :current, -> { where(active: true).order('LOWER(name)') }
    scope:order_by_name, -> { order('LOWER(name)') }
end
