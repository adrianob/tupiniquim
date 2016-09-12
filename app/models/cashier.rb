class Cashier < User
  def viewable_state
    [:delivered, :paid]
  end
end
