json.extract! waiter, :id, :name, :password, :cpf, :created_at, :updated_at
json.url waiter_url(waiter, format: :json)