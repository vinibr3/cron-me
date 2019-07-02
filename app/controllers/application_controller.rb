class ApplicationController < ActionController::Base
  include SessionHelper

  def default_url_options
    { locale: I18n.locale }
  end

  private

  def require_login
    redirect_to new_session_path unless signed_in?
  end
end
