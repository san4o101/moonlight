
class BillsService

  def replenishment_bill(bill, transaction_status, new_amount)
    old_amount = bill.amount
    ActiveRecord::Base.transaction do
      if bill.update(amount: old_amount + new_amount)
        add_transaction(bill.id, bill.id, transaction_status, new_amount)
      else
        raise ActiveRecord::RecordInvalid, bill
      end
    end
  end

  private

  def add_transaction(sender, recipient, status, amount)
    Transaction.create(sender_id: sender, recipient_id: recipient,
                       amount: amount, status: status)
  end

end
