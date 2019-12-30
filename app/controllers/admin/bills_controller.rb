module Admin
  class BillsController < AdminController
    before_action :set_bill
    before_action :set_user
    before_action :render_breadcrumbs, only: %i[show edit]
    before_action :show_breadcrumbs, only: %i[show edit]

    # GET /users/1/bills/1
    # GET /users/1/bills/1.json
    def show
      @transactions = @bill.transactions.order_by_date
    end

    # GET /users/1/bills/1/edit
    def edit
      add_breadcrumb I18n.t('breadcrumbs.actions.edit'), :edit_admin_user_bill_path
    end

    # PATCH/PUT /users/1/bills/1
    # PATCH/PUT /users/1/bills/1
    def update
      respond_to do |format|
        if @bill.update(bill_params)
          UpdateUserBillJob.perform_later(@bill, pundit_user)
          format.html { redirect_to admin_user_bill_path(@user, @bill), notice: t('bill.messages.successUpdated') }
          format.json { render :show, status: :ok, location: admin_user_bill_path(@user, @bill) }
        else
          format.html { render :edit }
          format.json { render json: @bill.errors, status: :unprocessable_entity }
        end
      end
    end

    private

    def set_user
      @user = @bill.user
    end

    def set_bill
      @bill = Bill.find(params[:id])
    end

    def bill_params
      params.require(:bill).permit(:expired_bill_at)
    end

    def show_breadcrumbs
      add_breadcrumb I18n.t('breadcrumbs.bills.bill'), :admin_user_bill_path
    end

    def render_breadcrumbs
      add_breadcrumb I18n.t('breadcrumbs.users.show', user: @user.full_name_aliases),
                     (proc { admin_user_path(@user.id) })
    end
  end
end