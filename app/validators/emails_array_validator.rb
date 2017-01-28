class EmailsArrayValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    bad_emails = (value || "").split.reject(&EmailValidator.method(:valid?))
    if bad_emails.any?
      record.errors.add attribute, "Invalid email(s): #{bad_emails.join(' ')}"
    end
  end
end
