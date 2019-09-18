class RegistrationsController < Devise::RegistrationsController
  layout "devise"

  def after_sign_in_path_for(user_admins)
    admin_static_pages_path
  end
end
