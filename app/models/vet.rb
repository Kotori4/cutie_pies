class Vet < ApplicationRecord
  belongs_to :user
  has_one_attached :vet_image
end
