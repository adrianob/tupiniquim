class OrderPolicy < ApplicationPolicy
  def new?
    user.is_a? Client
  end

  def update?
    new?
  end

  def create?
    new?
  end
end
