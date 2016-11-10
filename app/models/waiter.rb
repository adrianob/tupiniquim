class Waiter < User
  has_many :orders
  def viewable_state
    :ready
  end

  def orders_last_month
    orders.where('created_at between ? and ?', Time.now - 1.month, Time.now).count
  end
end
