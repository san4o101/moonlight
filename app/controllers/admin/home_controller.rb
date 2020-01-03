module Admin
  class HomeController < AdminController
    include ApplicationHelper
    before_action :set_active_notifications
    before_action :set_viewed_notifications

    def index; end

    private

    def set_active_notifications
      @active_notifications = ManagerNotification.includes(:admin, :bill).my_active pundit_user.id
    end

    def set_viewed_notifications
      @viewed_notifications = ManagerNotification.includes(:admin, :bill).my_viewed pundit_user.id
    end

  end
end