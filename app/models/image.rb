class Image < ActiveRecord::Base
  belongs_to :product
  belongs_to :paddler
  belongs_to :trip
  belongs_to :event
  belongs_to :waterbody

  mount_uploader :file, ImageUploader

  #attr_accessible :tag, :model, :model_id, :caption, :file, :file_cache, :remove_file

  validates :model, :model_id, :file, :tag, :presence => true
  #This custom validator checks to make sure a model that should only have 1 image doesn't already have an image.
  validates :model_id, :image_count => true, :on => :create

  def display_name
    fakie = self.model.constantize.new
    if fakie.respond_to?(:full_name)
      self.model.constantize.find(self.model_id).full_name
    elsif fakie.respond_to?(:name)
      self.model.constantize.find(self.model_id).name
    end
  end

  #CarrierWave has a filename method that I don't want to override
  def pretty_filename
    self.file.url.match(/\w+\.\w+$/).to_s if self.file?
  end
end
