class ImageCountValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if record.model.blank?
      record.errors.add attribute, "can't be blank"
    else
      rcd = record.model.constantize.find value
      if rcd.respond_to?(:image) && rcd.image
        record.errors.add attribute, 'already has an image. Please delete existing image if you want to add a new one.'
      end
    end
  end
end