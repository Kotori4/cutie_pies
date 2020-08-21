class Food < ApplicationRecord
  belongs_to :user

  has_one_attached :food_image
end
