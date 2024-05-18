class Lead < ApplicationRecord
  before_validation :sanitize_phone

  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "deve ser um email válido" }, uniqueness: true
  validates :name, presence: true

  private

  def sanitize_phone
    if phone.present?
      phone = self.phone.to_s # Convertendo para string
      # Verifica se o número de telefone já está no formato desejado
      unless phone.match?(/^\(\d{2}\) \d{5}-\d{4}$/)
        # Se não estiver no formato desejado, remove todos os caracteres não numéricos
        self.phone = phone.scan(/\d/).join
      end
    end
  end
end
