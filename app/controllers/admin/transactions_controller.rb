module Admin

  class TransactionsController < AdminController
    before_action :set_user
    before_action :set_bill, only: %i[index show]
    before_action :set_transaction, only: %i[show]
    before_action :render_breadcrumbs

    add_breadcrumb I18n.t('breadcrumbs.transactions.header'),
                   :admin_user_bill_transactions_path

    def index
      @transactions = @bill.transactions.order_by_date.page params[:page]
    end

    def show
      add_breadcrumb I18n.t('breadcrumbs.transactions.show'),
                     (proc { admin_user_bill_transaction_path(@user, @bill) })
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_bill
      @bill = Bill.find(params[:bill_id])
    end

    def set_user
      @user = User.find(params[:user_id])
    end

    def set_transaction
      @transaction = Transaction.includes(:sender, :recipient).find(params[:id])
    end

    def render_breadcrumbs
      add_breadcrumb I18n.t('breadcrumbs.users.show', user: @user.full_name_aliases),
                     (proc { admin_user_path(@user.id) })
      add_breadcrumb I18n.t('breadcrumbs.bills.bill'),
                     (proc { admin_user_bill_path(@user.id, @bill.id) })
    end
  end

end