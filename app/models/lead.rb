class Lead < ApplicationRecord
  before_save :normalize_phone_number
  before_save :convert_email_to_camelcase

  validates :email, presence: true, uniqueness: { case_sensitive: false }

  validates :name, presence: true
  validates :phone, format: { with: /\A\d{11}\z/, message: "Deve ter 11 números. "}

  private

  def convert_email_to_camelcase
    self.email = email.split('@').map(&:camelcase).join('@') if email.present?
  end

  def normalize_phone_number
    self.phone = phone.gsub(/\D/, '') if phone.present?
  end
end
