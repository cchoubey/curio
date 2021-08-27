class Category < ApplicationRecord
    scope :current, -> { where(active: true).order('LOWER(name)') }
    scope:order_by_name, -> { order('LOWER(name)') }
end
