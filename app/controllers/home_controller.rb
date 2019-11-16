class HomeController < ApplicationController

  def index
    flash[:success] = 'Admin page!'
    render :index
  end

  def user
    flash[:success] = 'User page!'
    render :index
  end

end
