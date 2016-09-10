class OrderDetail < ActiveRecord::Base
  belongs_to :menu_item
  belongs_to :dessert
  belongs_to :drink
  belongs_to :order, inverse_of: :order_details

end
