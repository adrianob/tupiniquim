class OrderDetail < ActiveRecord::Base
  include Statesman::Adapters::ActiveRecordQueries
  belongs_to :menu_item
  belongs_to :dessert
  belongs_to :drink
  belongs_to :order, inverse_of: :order_details

  has_many :transitions, class_name: "OrderDetailTransition", autosave: false
  has_many :order_detail_transitions

  delegate :can_transition_to?, :transition_to!, :transition_to, :current_state,
           to: :state_machine

  def self.transition_name
    :transitions
  end

  def self.transition_class
    OrderDetailTransition
  end
  private_class_method :transition_class

  # Initialize the state machine
  def state_machine
    @state_machine ||= OrderDetailStateMachine.new(self, transition_class: OrderDetailTransition,
                                                   association_name: :transitions)
  end

  def self.initial_state
    :created
  end
  private_class_method :initial_state

  def is_next?
    self == OrderDetail.in_state(:created).order('created_at asc').first
  end
end
