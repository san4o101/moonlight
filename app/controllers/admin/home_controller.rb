module Admin
  class HomeController < AdminController

    def index
      flash[:success] = t('controllers.admin.homePage')
      render :index
    end

  end
end