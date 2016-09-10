class OrderDetail < ActiveRecord::Base
  belongs_to :menu_item
  belongs_to :dessert
  belongs_to :drink
  belongs_to :order

end
