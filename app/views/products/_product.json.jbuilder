json.extract! product, :id, :name, :code, :thickness, :max_width, :max_height, :price_per_m2, :created_at, :updated_at
json.url product_url(product, format: :json)
