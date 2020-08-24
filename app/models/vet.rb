class Vet < ApplicationRecord
  belongs_to :user
  has_one_attached :vet_image
  has_many :vet_comments
end
