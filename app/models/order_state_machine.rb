class OrderStateMachine
  include Statesman::Machine

  state :created, initial: true
  state :ready
  state :delivered
  state :paid

  transition from: :created,   to: [:ready]
  transition from: :ready,     to: [:delivered]
  transition from: :delivered, to: [:paid]

  #guard_transition(to: :checking_out) do |order|
    #order.products_in_stock?
  #end
end
