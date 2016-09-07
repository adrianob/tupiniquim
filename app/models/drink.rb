class Drink < ActiveRecord::Base
  has_many :client_orders
end
