class CatPost < ApplicationRecord
  belongs_to :user
  
  has_one_attached :cat_image

  with_options presence: true do
    validates :cat_image
    validates :post_title
    validates :post_text
  end
end
