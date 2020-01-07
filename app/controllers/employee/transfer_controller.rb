module Employee

  class TransferController < EmployeeController
    before_action :set_user
    before_action :render_breadcrumbs
    before_action :set_my_bills, only: %i[new]
    before_action :transfer_params, only: %i[create]
    before_action :set_sender_bill, only: %i[create]
    before_action :set_recipient_bill, only: %i[create]
    before_action :check_sender_amount, only: %i[create]

    add_breadcrumb I18n.t('breadcrumbs.transfer.new'), :new_employee_transfer_path

    def new; end

    def create
      amount = params[:amount].to_f
      BillsService.new.transfer_money(@sender, @recipient, amount)
    end

    private

    def set_my_bills
      @bills = Bill.my_bills @current_user.id
    end

    def set_sender_bill
      @sender = Bill.find(params[:bill_id])
    end

    def set_recipient_bill
      @recipient = Bill.find_by_card_number(params[:card_number])
      if @recipient.nil? || @recipient.id == @sender.id
        flash[:warning] = t('messages.card_not_found')
        redirect_to action: :new
      end
    end

    def transfer_params
      params[:users_id] = pundit_user.id
      params[:card_number] = params[:card_number].delete(' ')
      params.permit(:users_id, :amount, :bill_id, :card_number)
    end

    def render_breadcrumbs
      add_breadcrumb I18n.t('breadcrumbs.bills.index'), :employee_bills_path
    end

    def check_sender_amount
      if @sender.amount < params[:amount].to_f
        flash[:danger] = t('messages.not_enough_money')
        redirect_to action: :new
      end
    end
  end

end

