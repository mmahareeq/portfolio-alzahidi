class ApplicationController < ActionController::Base

    before_action :set_locale  
   
    def default_url_options
      { locale: I18n.locale }
    end

    def set_locale
      I18n.locale = extract_locale_from_tld  || I18n.default_locale
      direction = (I18n.locale == :ar) ? "rtl" : "ltr"
      puts I18n.locale
      puts direction
    end
    
    def extract_locale_from_tld
      parsed_locale = params[:locale]
      I18n.available_locales.map(&:to_s).include?(parsed_locale) ? parsed_locale.to_sym : nil
    end
  

    rescue_from CanCan::AccessDenied do |exception|
      respond_to do |format|
        format.json { head :forbidden }
        format.html { redirect_to root_path, alert: exception.message }
      end
    end
end
