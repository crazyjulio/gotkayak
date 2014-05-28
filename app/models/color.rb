class Color < ActiveRecord::Base
  before_destroy :destroy_product_colors

  has_many :product_colors
  has_many :products, :through => :product_colors
  has_many :clearance_items

  validates_presence_of(:name)

  #Not sure why I can't get this working in a Rails-y kinda way
  def destroy_product_colors
    ProductColor.connection.execute("delete from product_colors where color_id = #{self.id}")
  end
end
