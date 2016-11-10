class WaiterPolicy < ApplicationPolicy

  def index?
    user.is_a? Cashier
  end

end
