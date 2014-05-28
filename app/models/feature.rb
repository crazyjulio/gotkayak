class Feature < ActiveRecord::Base
  before_destroy :destroy_version_features

  has_many :version_features
  has_many :versions, :through => :version_features
  belongs_to :manufacturer

  validates :name, :description, :manufacturer_id, :presence => true
  validates_numericality_of :price, :unless => Proc.new { |a| a.price.blank? }

  #Not sure why I can't get this working in a Rails-y kinda way
  def destroy_version_features
    VersionFeature.connection.execute("delete from version_features where feature_id = #{self.id}")
  end
end
