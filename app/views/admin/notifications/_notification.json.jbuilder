json.extract! notification, :id, :admin_id, :bill_id, :message, :status
json.url admin_notification_url(notification, format: :json)
