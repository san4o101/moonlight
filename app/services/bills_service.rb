
class BillsService

  def generate_bill_number
    Array.new(4) { rand.to_s[2..5] }.join
  end

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

  def transfer_money(sender_bill, recipient_bill, amount)
    amount_sender = sender_bill.amount
    amount_recipient = recipient_bill.amount
    sender_bill.transaction do
      recipient_bill.transaction do
        sender_bill.update!(amount: amount_sender - amount)
        recipient_bill.update!(amount: amount_recipient + amount)
        add_transaction(sender_bill.id, recipient_bill.id,
                        Transaction::STATUS_TRANSFER, amount)
      end
    end
  end

  private

  def add_transaction(sender_id, recipient_id, status, amount)
    Transaction.create(sender_id: sender_id, recipient_id: recipient_id,
                       amount: amount, status: status)
  end

end
