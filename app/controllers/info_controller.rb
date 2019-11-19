class InfoController < ApplicationController

  before_action :set_user, :its_me?
  layout :set_layout

  def index
    render :index
  end

  def update
    if @current_user.update(user_params)
      redirect_to info_path(@current_user),
                  notice: t('user.message.successUpdate')
    else
      render :index
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @current_user = User.find(params[:id])
  end

  def its_me?
    unless InfoService.new.check_users(@current_user.id, session[:user_id])
      flash[:warning] = t('user.message.errorSeeOtherPage')
      redirect_to info_path(session[:user_id])
    end
  end

  def set_layout
    InfoService.new.change_layout(@current_user)
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :second_name)
  end

end
