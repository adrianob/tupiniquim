class Client < User
  has_many :client_orders
  has_many :feedbacks
end
