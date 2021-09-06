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

    validate do
      c = Category.where('lower(name) = ?', self.name.downcase) 
      if c.length > 0
        if self.id.nil?
          self.errors.add(:base, 'This category already exists')
        else
          if self.id != c[0].id
            self.errors.add(:base, 'Cant change name. This category already exists')
          end
        end
      end
    end
end
