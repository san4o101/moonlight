module Admin
  class BillsController < AdminController
    before_action :set_user
    before_action :set_bill
    before_action :render_breadcrumbs, only: %i[show edit]

    # GET /users/1/bills/1
    # GET /users/1/bills/1.json
    def show
      add_breadcrumb I18n.t('breadcrumbs.bills.bill'), :admin_user_bill_path
      @transactions = @bill.transactions.order_by_date.limit(15)
    end

    # GET /users/1/bills/1/edit
    def edit; end

    # PATCH/PUT /users/1/bills/1
    # PATCH/PUT /users/1/bills/1
    def update; end

    private

    def set_user
      @user = User.find(params[:user_id])
    end

    def set_bill
      @bill = Bill.find(params[:id])
    end

    def bill_params
      params.require(:bill).permit
    end

    def render_breadcrumbs
      add_breadcrumb I18n.t('breadcrumbs.users.show', user: @user.full_name),
                     (proc { admin_user_path(@user.id) })
    end
  end
end