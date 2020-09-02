class Vet < ApplicationRecord
  belongs_to :user
  has_one_attached :vet_image
  has_many :vet_comments

  with_options presence: true do
    validates :vet_title
    validates :vet_text
  end
end
