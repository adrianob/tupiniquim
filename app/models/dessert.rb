class Dessert < ActiveRecord::Base
  has_many :client_orders
end
