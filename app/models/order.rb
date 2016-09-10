class Order < ActiveRecord::Base
  belongs_to :waiter
  belongs_to :restaurant_table
  has_many :order_details

end
