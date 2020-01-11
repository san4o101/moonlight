module Employee

  class ReplenishmentController < EmployeeController
    before_action :set_user
    before_action :render_breadcrumbs
    before_action :set_my_bills, only: %i[new]
    before_action :set_bill, only: %i[create]

    add_breadcrumb I18n.t('breadcrumbs.replenishment.new'), :new_employee_replenishment_path

    def new; end

    def create
      BillsService.new.replenishment_bill(@bill, Transaction.statuses[:i_replenishment],
                                          replenishment_params[:amount].to_f)
      respond_to do |format|
        format.html { redirect_to employee_bill_url(@bill), notice: t('messages.success_rep_bill') }
        format.json { render :new, status: :ok, location: employee_bill_url(@bill) }
      end
    rescue ActiveRecord::RecordInvalid => e
      respond_to do |format|
        format.html { redirect_to new_employee_replenishment_path(@bill), notice: e.message }
        format.json { render json: @bill.errors, status: :unprocessable_entity }
      end
    end

    private

    def set_my_bills
      @bills = Bill.my_bills @current_user.id
    end

    def set_bill
      @bill = Bill.find(params[:bill_id])
    end

    def replenishment_params
      params[:users_id] = pundit_user.id
      params.permit(:users_id, :amount, :bill_id)
    end

    def render_breadcrumbs
      add_breadcrumb I18n.t('breadcrumbs.bills.index'), :employee_bills_path
    end
  end

end
