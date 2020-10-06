class DogPost < ApplicationRecord
  belongs_to :user
  has_one_attached :dog_image

  with_options presence: true do
    validates :dog_image
    validates :dog_post_title
    validates :dog_post_text
  end
end
