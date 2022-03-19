class Brand < ApplicationRecord
    belongs_to :category
    
    scope:order_by_name, -> { order('LOWER(brand_name)') }
    scope :current, -> { where(active: true).order('LOWER(name)') }
end
