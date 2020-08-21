class CatPostComment < ApplicationRecord
  belongs_to :user
  belongs_to :cat_post

  validates :cat_post_comment, presence: true
end
