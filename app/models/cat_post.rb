class CatPost < ApplicationRecord
  belongs_to :user
  has_one_attached :cat_image
  has_many :cat_post_comments, dependent: :destroy

  with_options presence: true do
    validates :cat_image
    validates :cat_post_title
    validates :cat_post_text
  end
end
