class ApplicationController < ActionController::Base
  include SessionsHelper

  before_action :set_locale

  private

  def default_url_options
    {locale: I18n.locale}
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def after_sign_in_path_for(resource)
    admin_static_pages_path
  end

  def after_sign_out_path_for(resource_or_scope)
    new_user_admin_session_path
  end
end
