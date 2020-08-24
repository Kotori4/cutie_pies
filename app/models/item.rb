class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :item_image
  has_many :item_comments

  with_options presence: true do
    validates :item_title
    validates :item_text
  end
end
