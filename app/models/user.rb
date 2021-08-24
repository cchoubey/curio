class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  scope:order_by_first_name, -> { order('LOWER(first_name)') }
  validates :first_name, presence: true

  #belongs_to :userType #s, class_name: "user_type", foreign_key: "user_type_id"
end
