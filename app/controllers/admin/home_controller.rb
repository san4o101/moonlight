module Admin
  class HomeController < AdminController

    def index
      flash[:success] = 'Admin page!'
      render :index
    end

  end
end