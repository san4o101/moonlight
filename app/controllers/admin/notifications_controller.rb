module Admin

  class NotificationsController < AdminController
    before_action :set_notification, only: %i[show edit update destroy]
    before_action :set_active_notifications, only: %i[index]
    before_action :set_viewed_notifications, only: %i[index]

    add_breadcrumb I18n.t('breadcrumbs.notification.index'), :admin_notifications_path

    def index; end

    def show
      render_breadcrumbs
    end

    def edit
      render_breadcrumbs
      add_breadcrumb I18n.t('breadcrumbs.notification.edit_admin'), :edit_admin_notification_path
    end

    def update
      respond_to do |format|
        if @notification.update(update_admin_params)
          format.html { redirect_to admin_notifications_path, notice: t('notifications.messages.successEditAdmin') }
          format.json { render :show, status: :ok, location: admin_notifications_url }
        else
          format.html { render :edit }
          format.json { render json: @notification.errors, status: :unprocessable_entity }
        end
      end
    end

    #def destroy
    #  @notification.destroy
    #  respond_to do |format|
    #    format.html { redirect_to notifications_url, notice: 'Notification was successfully destroyed.' }
    #    format.json { head :no_content }
    #  end
    #end

    private

    def set_notification
      @notification = ManagerNotification.includes(:admin, :bill).find(params[:id])
      my_notification? @notification.id
    end

    def update_admin_params
      params.require(:manager_notification).permit(:admin_id)
    end

    def set_active_notifications
      @active_notifications = ManagerNotification.includes(:admin, :bill).my_active pundit_user.id
    end

    def set_viewed_notifications
      @viewed_notifications = ManagerNotification.includes(:admin, :bill).my_viewed pundit_user.id
    end

    def render_breadcrumbs
      add_breadcrumb I18n.t('breadcrumbs.notification.show',
                            notification: @notification.id), :admin_notification_path
    end

  end

end