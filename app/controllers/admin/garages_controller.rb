module Admin
  class GaragesController < Admin::BaseController

    def new
      render "admin/static_pages/index"
    end
  end
end