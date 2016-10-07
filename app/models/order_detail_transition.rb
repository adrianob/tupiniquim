class OrderDetailTransition < ActiveRecord::Base
  belongs_to :order_detail, inverse_of: :order_detail_transitions

  after_destroy :update_most_recent, if: :most_recent?

  private

  def update_most_recent
    last_transition = order_detail.order_detail_transitions.order(:sort_key).last
    return unless last_transition.present?
    last_transition.update_column(:most_recent, true)
  end
end
