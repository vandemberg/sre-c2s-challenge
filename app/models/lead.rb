class Lead < ApplicationRecord
  validates :email, presence: true, uniqueness: false, format: { with: URI::MailTo::EMAIL_REGEXP, message: :invalid }
  validates :name, presence: true
  validates :phone, presence: true, format: { with: /\A\(?\d{2}\)?\s?\d{4,5}-?\d{4}\z/, message: :invalid }
end