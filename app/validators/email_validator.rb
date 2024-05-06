class EmailValidator < ActiveModel::EachValidator
    def self.compliant?(value)
        email_regexp = /\A[\w+\-.]+@[a-z\d\-.]+(\.[a-z\dz\-]+)*\.[a-z]+\z/i

        value.match(email_regexp)
    end

    def validate_each(record, attribute, value)
        return if value.blank? || self.class.compliant?(value)

        record.errors.add(attribute, I18n.t("errors.messages.invalid"))
    end
end