json.extract! work_log, :id, :tracking_id, :user_id, :created_at, :updated_at
json.url work_log_url(work_log, format: :json)
