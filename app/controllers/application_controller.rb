class ApplicationController < ActionController::Base
  before_action :set_locale

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  # Este método pode ser usado para incluir o locale nos links
  def default_url_options
    { locale: I18n.locale }
  end
end
