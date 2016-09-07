class ClientOrder < ActiveRecord::Base
  belongs_to :menu_item
  belongs_to :dessert
  belongs_to :drink
  belongs_to :client
  belongs_to :waiter
  belongs_to :restaurant_table

end
