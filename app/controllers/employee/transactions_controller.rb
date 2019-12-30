module Employee

  class TransactionsController < EmployeeController
    before_action :set_user
    before_action :set_bill, only: %i[index show]
    before_action :set_transaction, only: %i[show]
    before_action :render_breadcrumbs

    add_breadcrumb I18n.t('breadcrumbs.transactions.index'),
                   :employee_bill_transactions_path

    def index
      @transactions = @bill.transactions.order_by_date.page params[:page]
    end

    def show
      add_breadcrumb I18n.t('breadcrumbs.transactions.show'),
                     :employee_bill_transaction_path
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_bill
      @bill = Bill.find(params[:bill_id])
      my_bill? @bill.id
    end

    def set_transaction
      @transaction = Transaction.includes(:sender, :recipient).find(params[:id])
      my_transaction?
    end

    def render_breadcrumbs
      add_breadcrumb I18n.t('breadcrumbs.bills.index'), :employee_bills_path
      add_breadcrumb I18n.t('breadcrumbs.bills.show'),
                     (proc { employee_bill_path(@bill.id) })
    end

    def my_transaction?
      my_transactions_id = Transaction
                           .where('sender_id = :id or recipient_id = :id', id: @bill.id)
                           .pluck(:id)
      unless my_transactions_id.include?(params[:id].to_i)
        render_error_page(403, :forbidden)
      end
    end
  end

end