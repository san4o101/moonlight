json.extract! transaction, :id, :amount, sender_id, :recipient_id, :created_at, :status
json.url admin_user_bill_transactions_url(transaction, format: :json)
