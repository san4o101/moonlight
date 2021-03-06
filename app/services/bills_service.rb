
class BillsService

  def generate_bill_number
    # Array.new(4) { rand.to_s[2..5] }.join
    user_time_i = Time.new(1998, 6, 10, 12, 0, 0).to_i
    one_number = Time.now.to_i.to_s.reverse.scan(/.{4}/)[0]
    two_number = (Time.now.to_i - user_time_i).to_s.scan(/.{4}/)[1]
    three_number = Time.at(Time.now.to_f + user_time_i).to_f.to_s.scan(/.{4}/).last
    four_number = Time.now.to_f.to_s.reverse.scan(/.{4}/)[0]
    "#{one_number}#{two_number}#{three_number}#{four_number}"
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
                        Transaction.statuses[:transfer], amount)
      end
    end
  end

  def update_bill(bill, params)
    if bill.deposit?
      bill.update(params)
    elsif bill.credit?
      bill.transaction do
        bill.update(params)
        bill.amount = params[:amount_limit]
        bill.save!
      end
    end
  end

  private

  def add_transaction(sender_id, recipient_id, status, amount)
    Transaction.create(sender_id: sender_id, recipient_id: recipient_id,
                       amount: amount, status: status)
  end

end
