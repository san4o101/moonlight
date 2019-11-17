class InfoController < ApplicationController

  before_action :set_user, :its_me?
  layout :set_layout

  def index
    flash[:success] = 'Enter you First, Last and Second Name'
    render :index
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @current_user = User.find(params[:id])
  end

  def its_me?
    unless InfoService.new.check_users(@current_user.id, session[:user_id])
      flash[:warning] = 'Not see other users! Redirect to you profile!'
      redirect_to user_info_path(session[:user_id])
    end
  end

  def set_layout
    InfoService.new.change_layout(@current_user)
  end

end
