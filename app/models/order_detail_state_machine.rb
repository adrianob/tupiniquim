class OrderDetailStateMachine
  include Statesman::Machine

  state :created, initial: true
  state :ready
  state :delivered
  state :paid

  transition from: :created,   to: [:ready]
  transition from: :ready,     to: [:delivered]
  transition from: :delivered, to: [:paid]

  guard_transition(to: :ready) do |order_detail|
    order_detail.is_next?
  end
end
