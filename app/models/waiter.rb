class Waiter < User
  def viewable_state
    :ready
  end
end
