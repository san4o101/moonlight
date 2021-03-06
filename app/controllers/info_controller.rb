# frozen_string_literal: true

# @class InfoController
# @extend ApplicationController
# User information show and update
class InfoController < ApplicationController

  before_action :set_user
  before_action :its_me?, unless: :user_admin
  layout :set_layout

  # Show user information
  def index
    add_breadcrumb I18n.t('breadcrumbs.info.index'), :info_path
    render :index
  end

  # Update user information
  def update
    if @current_user.update(user_params)
      redirect_to info_path(@current_user),
                  notice: t('user.message.successUpdate')
    else
      render :index
    end
  end

  private

  # set local variable @current_user
  # @return @current_user
  def set_user
    @current_user = User.find(params[:id])
    setup_breadcrumbs
  end

  # Check my page (route)
  # redirect to user page If it's not session[:user_id] page
  def its_me?
    unless InfoService.new.check_users(@current_user.id, session[:user_id])
      flash[:warning] = t('user.message.errorSeeOtherPage')
      redirect_to info_path(session[:user_id])
    end
  end

  # Set current layout.
  # If user admin     -> layout 'admin'
  # If user employee  -> layout 'employee'
  # @return string
  def set_layout
    InfoService.new.change_layout(pundit_user)
  end

  # Get user params from request
  def user_params
    params.require(:user).permit(:first_name, :last_name, :second_name,
                                 :birthday, :gender, :phone, :cities_id)
  end

  def setup_breadcrumbs
    if @current_user.user_role?
      add_breadcrumb I18n.t('breadcrumbs.home'), :employee_home_path
    elsif @current_user.admin_role?
      add_breadcrumb I18n.t('breadcrumbs.home'), :admin_home_path
      admin_notifications_count
    end
  end

end
