class Product < ApplicationRecord
    belongs_to :category
    #belongs_to :user
    has_many :product_comments
    scope :current, -> { where(active: true).order('LOWER(name)') }
    scope:order_by_name, -> { order('LOWER(name)') }
    has_many_attached :images
    validates :name, presence: true
    validates :stock, presence: true
    validates :price, presence: true
    validate :image_type
    def thumbnail input
          self.images[input].variant(resize: "300x300").processed
    end

    private
    def image_type
        if images.attached? == false
            errors.add(:images, "are missing")
        end
        images.each do |image|
            if !image.content_type.in?(%('image/jpeg' 'image/png'))
                errors.add(:images, "needs to be JPEG or PNG")
            end
        end
    end
end
