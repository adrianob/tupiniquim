class Order < ActiveRecord::Base
  include Statesman::Adapters::ActiveRecordQueries
  belongs_to :client
  has_many :order_details, inverse_of: :order, dependent: :destroy
  has_many :transitions, class_name: "OrderTransition", autosave: false
  has_many :order_transitions

  accepts_nested_attributes_for :order_details, allow_destroy: true
  delegate :can_transition_to?, :transition_to!, :transition_to, :current_state,
           to: :state_machine

  def is_next?
    self == Order.in_state(:created).order('created_at asc').first
  end

  def self.transition_name
    :transitions
  end

  def self.transition_class
    OrderTransition
  end
  private_class_method :transition_class

  # Initialize the state machine
  def state_machine
    @state_machine ||= OrderStateMachine.new(self, transition_class: OrderTransition,
                                                   association_name: :transitions)
  end

  def self.initial_state
    :created
  end
  private_class_method :initial_state
end
