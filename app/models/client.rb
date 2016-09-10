class Client < User
  has_many :orders
  has_many :feedbacks, foreign_key: :user_id
  has_many :order_details, through: :orders
end
