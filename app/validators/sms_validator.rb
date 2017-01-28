class SmsValidator < ActiveModel::EachValidator
  SMS_REGEXP = /^\+\d{7,20}$/

  def validate_each(record, attribute, value)
    if value.present? && self.class.normalize(value) !~ SMS_REGEXP
      record.errors.add attribute, "Invalid phone number: #{value}"
    end
  end

  def self.normalize(value)
    value.gsub(/[\s\-\(\)]+/, '')
  end
end
