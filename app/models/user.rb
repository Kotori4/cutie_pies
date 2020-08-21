class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :cat_posts, dependent: :destroy
         has_many :cat_post_comments, dependent: :destroy
         has_many :foods, dependent: :destroy

         with_options presence: true do
          validates :nickname
          validates :password, format: { with: /\A[a-z]+[0-9]+\z/i}
          validates :favorite_id
          validates :have_pet_id
        end

         extend ActiveHash::Associations::ActiveRecordExtensions
         belongs_to_active_hash :favorite
         belongs_to_active_hash :have_pet      
end


