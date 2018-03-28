class ValidCatchDateValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value.year != Date.today.year
      record.errors[attribute] << (options[:message] || 'must be for the current year')
    elsif value > Date.today
      record.errors[attribute] << (options[:message] || 'cannot be for a fish you hope to catch in the future')
    end
  end
end
