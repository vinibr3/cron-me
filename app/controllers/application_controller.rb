class ApplicationController < ActionController::Base
  include SessionHelper

  def default_url_options
    { locale: I18n.locale }
  end
end
