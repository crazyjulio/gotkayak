class Trip < ApplicationRecord
  belongs_to :waterbody
  has_many :paddlers

  mount_uploaders :images, ImageUploader

  validates :description, :name, :start_date, :waterbody_id, presence: true
  validates_numericality_of :mileage, unless: proc { |a| a.mileage.blank? }
end
