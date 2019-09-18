module Admin
  class StaticPagesController < Admin::BaseController
    before_action :authenticate_user_admin!

    def index
      render "admin/static_pages/index"
    end

  end
end
