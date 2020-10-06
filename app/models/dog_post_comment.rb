class DogPostComment < ApplicationRecord
  belongs_to :user
  belongs_to :dog_post

  validates :dog_post_comment, presence: true
end
