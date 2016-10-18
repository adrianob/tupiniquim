class OrderPolicy < ApplicationPolicy
  def new?
    update? && !user.order_details.not_in_state(:paid).present?
  end

  def update?
    user.is_a? Client
  end

  def edit?
    update?
  end

  def create?
    new?
  end

  def destroy?
    user.admin?
  end

end
