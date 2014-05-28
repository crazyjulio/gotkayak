class Version < ActiveRecord::Base
  before_destroy :destroy_version_features

  belongs_to :product
  belongs_to :manufacturer
  has_many :clearance_items
  has_many :version_features, :foreign_key => :version_id
  has_many :features, :through => :version_features

  validates :description, :product_id, :manufacturer_id, :name, :price, :presence => true
  validates :price, :numericality => true

  #Not sure why I can't get this working in a Rails-y kinda way
  def destroy_version_features
    VersionFeature.connection.execute("delete from version_features where version_id = #{self.id}")
  end

  scope :base_version, lambda { |versions|
    where("base_version = 't' and id in (?)", versions)
  }
end
