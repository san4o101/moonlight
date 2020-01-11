
class BillRequestsService

  public

  def create_approved_bill_request(user_id, bill_id)
    BillRequest.create(admin_id: user_id, bill_id: bill_id,
                       approved_at: DateTime.now,
                       message: I18n.t('bill_request.auto_approved'),
                       approved_status: BillRequest.approved_statuses[:approved])
  end

end