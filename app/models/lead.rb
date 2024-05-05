class Lead < ApplicationRecord
  before_save :downcase_email
  before_save :format_phone

  validates :email, presence: true, uniqueness: false, format: { with: URI::MailTo::EMAIL_REGEXP, message: :invalid }
  validates :name, presence: true
  validates :phone, presence: true, format: { with: /\A\(?\d{2}\)?\s?\d{4,5}-?\d{4}\z/, message: :invalid }

  def downcase_email
    self.email = email.downcase
  end

  def format_phone
    cleaned_phone = phone.gsub(/[^0-9]/, "")
    
    if cleaned_phone.length == 11
      self.phone = "(#{cleaned_phone[0..1]}) #{cleaned_phone[2..6]}-#{cleaned_phone[7..-1]}"
    elsif cleaned_phone.length == 10
      self.phone = "(#{cleaned_phone[0..1]}) #{cleaned_phone[2..5]}-#{cleaned_phone[6..-1]}"
    else
      self.phone = cleaned_phone
    end
  end
end