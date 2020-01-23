module Admin

  class NotificationsController < AdminController
    before_action :set_notification, only: %i[show edit update close activate_bill]
    before_action :set_bill_variables, only: %i[activate_bill]
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

    def close
      respond_to do |format|
        # Update status on VIEWED
        if @notification.viewed!
          format.html { redirect_to admin_notification_path(@notification), notice: t('notifications.messages.successEditStatus') }
          format.json { head :no_content }
        else
          format.html { redirect_to admin_notification_path(@notification), notice: t('notifications.messages.errorEditStatus') }
          format.json { render json: @notification.errors, status: :unprocessable_entity }
        end
      end
    end

    def activate_bill
      unless @bill.full_info? && @bill.credit?
        return redirect_to edit_admin_user_bill_path(@bill_user, @bill), notice: t('notifications.messages.errorBillInfo')
      end
      @notification.viewed!
      BillRequestsService.new.create_approved_bill_request(pundit_user.id, @bill.id,
                                                           I18n.t('bill_request.admin_approved', admin: pundit_user.full_name))
      UpdateUserBillJob.perform_later(@bill, pundit_user, I18n.t('mails.update_bill.approved', card: @bill.card_number,
                                                                                               admin: pundit_user.full_name))
      redirect_to admin_notification_path(@notification), notice: t('notifications.messages.successActivateBill')
    end

    private

    def set_notification
      id = params[:id].present? ? params[:id] : params[:notification_id]
      @notification = ManagerNotification.includes(:admin, :bill).find(id)
      my_notification? @notification.id
    end

    def set_bill_variables
      @bill = @notification.bill
      @bill_user = @notification.bill.user
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