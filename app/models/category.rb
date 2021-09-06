class Category < ApplicationRecord
    has_many :products
    scope :current, -> { where(active: true).order('LOWER(name)') }
    scope:order_by_name, -> { order('LOWER(name)') }
    has_one_attached :bggroundimage
    validates :name, :presence => true

    def image_thumbnail
        if bggroundimage.attached? 
        bggroundimage.variant(resize: "300x300").processed
         # else
         #   "default.jpg"
         end
       end
end
