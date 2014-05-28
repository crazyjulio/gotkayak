class Manufacturer < ActiveRecord::Base
  has_many :products, :dependent => :destroy
  has_many :features, :dependent => :destroy
  #has_many :colors

  validates :name, :link, :presence => true

  def kayaks
    Product.kayaks self.id
  end
end
