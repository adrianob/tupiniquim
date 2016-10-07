class Order < ActiveRecord::Base
  belongs_to :client
  belongs_to :waiter, required: false
  has_many :order_details, inverse_of: :order, dependent: :destroy

  accepts_nested_attributes_for :order_details, allow_destroy: true

end
