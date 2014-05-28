class Trip < ActiveRecord::Base
  before_destroy :destroy_images
  belongs_to :waterbody
  has_many :paddlers
  has_many :images

  serialize :paddler_kayak, Hash

  validates :description, :name, :start_date, :waterbody_id, :presence => true
  validates_numericality_of :mileage, :unless => Proc.new { |a| a.mileage.blank? }

  def destroy_images
    self.images.destroy_all if self.images
  end

  def self.serialized_attr_accessor(*args)
    args.each do |method_name|
      eval "
        def #{method_name}
          (self.paddler_kayak || {})[:#{method_name}]
        end
        def #{method_name}=(value)
          self.paddler_kayak ||= {}
          self.paddler_kayak[:#{method_name}] = value
        end
      "
    end
  end

  serialized_attr_accessor :paddler, :kayak

  def images
    Image.where(["model=? and model_id=?", "Trip", self.id])
  end

end
