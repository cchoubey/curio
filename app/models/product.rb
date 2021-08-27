class Product < ApplicationRecord
    belongs_to :category
    #belongs_to :user
    scope :current, -> { where(active: true).order('LOWER(name)') }
    scope:order_by_name, -> { order('LOWER(name)') }
end
