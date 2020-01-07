json.extract! transaction, :id, :amount, :sender_id, :recipient_id, :created_at, :status
json.url employee_bill_transaction_url(@bill, transaction, format: :json)
