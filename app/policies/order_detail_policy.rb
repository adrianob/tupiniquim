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
    if @record.current_state == 'created'
      @record.is_next? && user.admin?
    else
      user.admin?
    end
  end

  def new?
    user.is_a? Client
  end
end
