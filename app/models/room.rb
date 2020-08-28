class Room < ApplicationRecord
  has_many :room_users
  has_many :users, through: :room_users, dependent: :destroy
  has_many :messages, dependent: :destroy

  def template
    ApplicationController.renderer.render partial: 'messages/message', locals: { message: self }
  end
end
