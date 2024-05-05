class Lead < ApplicationRecord
  validates :email, presence: { message: I18n.t("lead.email_presence") },
                    format: { with: URI::MailTo::EMAIL_REGEXP, message: I18n.t("lead.email_format") }
  validates :name, presence: { message: I18n.t("lead.name_presence") }
  validates :phone, presence: { message: I18n.t("lead.phone_presence") },
                    numericality: { only_integer: true, message: I18n.t("lead.phone_format") }

  before_validation :strip_non_numeric_characters
  before_save :format_phone, if: :will_save_change_to_phone?

  private

  def format_phone
    self.phone = format_phone_number(phone) if phone.present?
  end

  def format_phone_number(phone_number)
    digits = phone_number.gsub(/\D/, '')
    
    if digits.length == 11
      formatted_phone_number = "(#{digits[0,2]}) #{digits[2,5]}-#{digits[7,4]}"
    elsif digits.length == 10
      formatted_phone_number = "(#{digits[0,2]}) #{digits[2,4]}-#{digits[6,4]}"
    else
      formatted_phone_number = phone_number
    end
  
    return formatted_phone_number
  end  

  def strip_non_numeric_characters
    self.phone = phone.scan(/\d/).join if phone.present?
  end
end