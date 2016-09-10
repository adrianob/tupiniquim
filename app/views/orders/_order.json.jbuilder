json.extract! order, :id, :restaurant_table, :waiter, :state, :created_at, :updated_at
json.url order_url(order, format: :json)