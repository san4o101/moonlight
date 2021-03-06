json.extract! bill, :id, :users_id, :bill_type, :amount,
              :percent, :close_at, :replenishment_at, :expired_bill_at,
              :regular_replenishment_amount, :early_close_status,
              :amount_limit, :created_at, :updated_at
json.url admin_user_bill_url(bill.users_id, bill, format: :json)
