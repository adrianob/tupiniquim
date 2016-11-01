class OrderDetailPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin?
        scope.in_state(user.viewable_state)
      else
        user.order_details.not_in_state(:paid)
      end
    end
  end

  def update_state?
    user.admin?
  end

  def new?
    user.is_a? Client
  end
end
