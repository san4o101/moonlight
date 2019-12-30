# frozen_string_literal: true

# @class EmployeeController
# @extend ApplicationController
# Main employee controller
class EmployeeController < ApplicationController

  before_action :employee_user!
  layout 'employee'

  add_breadcrumb I18n.t('breadcrumbs.home'), :employee_home_path

  private

  # Check user role. Is employee or not
  # Render error 403 page
  # @return render
  def employee_user!
    render_error_page(403, :forbidden) unless pundit_user.user_role?
  end

  def set_user
    @current_user = pundit_user
  end

  # Used only after set_user
  def my_bill?(bill_id)
    my_bills_id = Bill.my_bills(@current_user.id).pluck(:id)
    params[:id] = params[:bill_id] unless params[:id].present?
    unless my_bills_id.include?(bill_id)
      render_error_page(403, :forbidden)
    end
  end

  def my_transaction?(bill_id, transaction_id)
    my_transactions_id = Transaction
                         .where('sender_id = :id or recipient_id = :id', id: bill_id)
                         .pluck(:id)
    unless my_transactions_id.include?(transaction_id)
      render_error_page(403, :forbidden)
    end
  end

end

