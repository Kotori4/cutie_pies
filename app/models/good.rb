class Good < ApplicationRecord
  belongs_to :user
  has_one_attached :goods_image
end
