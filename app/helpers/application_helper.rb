module ApplicationHelper
end

module ApplicationHelper
    def formatted_phone(phone)
      phone.gsub(/(\d{2})(\d{5})(\d{4})/, '(\1) \2-\3')
    end
  end
  
