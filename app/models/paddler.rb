class Paddler < ApplicationRecord
  has_many :trips

  mount_uploader :image, ImageUploader

  validates :name, :height, :weight, presence: true
end
