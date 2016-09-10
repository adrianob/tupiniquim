json.extract! cashier, :id, :name, :password, :cpf, :created_at, :updated_at
json.url cashier_url(cashier, format: :json)