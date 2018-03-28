class ValidNumberOfImagesValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value.empty?
      record.errors[attribute] << (options[:message] || 'must have at least 1 image')
    elsif value.length > 3
      record.errors[attribute] << (options[:message] || 'must have no more than 3 images')
    end
  end
end
