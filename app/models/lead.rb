class Lead < ApplicationRecord
  
  
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :name, presence: true
  validates :phone, presence: true
  before_validation :format_phone

  private

  def format_phone
    # Removendo todos os caracteres não numéricos do telefone
    self.phone = phone.to_s.gsub(/\D/, '')

    
      # Aplicando a máscara ao telefone
      self.phone = phone.to_s.gsub(/(\d{2})(\d{5})(\d{4})/, '(\1) \2-\3')
       
    end
  end