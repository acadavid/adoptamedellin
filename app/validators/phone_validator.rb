class PhoneValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    unless value =~ /\A\d{7,10}\z/
      record.errors[attribute] << (options[:message] || I18n.t(".errors.messages.invalid"))
    end
  end

end