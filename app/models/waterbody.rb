class Waterbody < ActiveRecord::Base
  before_destroy :destroy_image

  has_many :trips, :dependent => :destroy
  has_one :image

  validates :name, :water_type, :presence => true
  validates :name, :uniqueness => true

  def destroy_image
    self.image.destroy if self.image
  end

  def image
    Image.where(["model=? and model_id=?", "Waterbody", self.id]).limit(1)[0]
  end

  def self.image_limit
    1
  end
end
