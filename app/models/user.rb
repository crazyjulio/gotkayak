class User < ApplicationRecord
  mount_uploader :image, ImageUploader
  extend FriendlyId
  friendly_id :name, use: :slugged

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

  has_many :fish
end
