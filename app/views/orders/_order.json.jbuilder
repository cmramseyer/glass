json.extract! order, :id, :customer, :description, :priority, :delivery_address, :created_at, :updated_at
json.url order_url(order, format: :json)
