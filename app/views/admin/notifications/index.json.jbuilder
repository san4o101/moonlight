json.array! @active_notifications, partial: 'admin/notifications/notification',
                                   as: :notification
json.array! @viewed_notifications, partial: 'admin/notifications/notification',
                                   as: :notification
