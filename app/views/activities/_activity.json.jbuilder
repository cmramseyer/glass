json.extract! activity, :id, :user_id, :message, :created_at, :updated_at
json.url activity_url(activity, format: :json)
