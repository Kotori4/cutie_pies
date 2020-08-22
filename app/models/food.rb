class Food < ApplicationRecord
  belongs_to :user
  has_one_attached :food_image

  with_options presence: true do
    validates :food_title
    validates :food_text
  end
end
