json.extract! order_detail, :id, :order, :menu_item, :dessert, :drink, :created_at, :updated_at
json.url order_detail_url(order_detail, format: :json)