class Product < ActiveRecord::Base
  before_destroy :destroy_images
  before_destroy :destroy_product_colors

  has_many :product_colors
  has_many :colors, :through => :product_colors
  has_many :versions, :dependent => :destroy
  belongs_to :manufacturer
  has_many :clearance_items, :dependent => :destroy
  has_many :images

  validates :manufacturer_id, :name, :description, :product_type, :presence => true
  validates_numericality_of :length, :unless => Proc.new{|a| a.length.blank?}
  validates_numericality_of :width, :unless => Proc.new { |a| a.width.blank? }
  validates_numericality_of :height, :unless => Proc.new { |a| a.height.blank? }
  validates_numericality_of :weight, :unless => Proc.new { |a| a.weight.blank? }
  validates_numericality_of :capacity, :unless => Proc.new { |a| a.capacity.blank? }

  attr_accessor :full_name

  def destroy_images
    self.images.destroy_all if self.images
  end

  #Not sure why I can't get this working in a Rails-y kinda way
  def destroy_product_colors
    ProductColor.connection.execute("delete from product_colors where product_id = #{self.id}")
  end

  def self.get_kayaks
    Product.where("product_type='kayak'")
  end

  def full_name
    "#{manufacturer.name} #{name}"
  end

  def images
    Image.where(["model=? and model_id=?", "Product", self.id])
  end

  def base_version
    Version.base_version(self.versions)
  end

  def standard_features
    base_version[0].features.collect{|x| x.name if x.price.nil?}.compact
  end

  def optional_features
    base_version[0].features.collect { |x| [x.name, x.description, x.price] unless x.price.nil? }.compact
  end

  def main_image
    Image.where(["model=? and model_id=? and tag='main'", "Product", self.id])
  end

  scope :kayaks, lambda { |mfr_id|
    where("product_type = 'kayak' and manufacturer_id = ?", mfr_id)
  }
end
