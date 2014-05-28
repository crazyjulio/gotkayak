class Paddler < ActiveRecord::Base
  before_destroy :destroy_image

  has_many :trips
  has_one :image

  validates :name, :height, :weight, :presence => true

  def destroy_image
    self.image.destroy if self.image
  end

  def image
    Image.where(["model=? and model_id=?", "Paddler", self.id]).limit(1)[0]
  end

  def self.image_limit
    1
  end
end
