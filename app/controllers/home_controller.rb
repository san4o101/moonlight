class HomeController < ApplicationController

  def index
    flash[:success] = "Home page!"
    render :index
  end

end
