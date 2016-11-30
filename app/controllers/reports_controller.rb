class ReportsController < ApplicationController
  def show
    @orders = Order.all.group_by(&:day)
    @order_details = OrderDetail.created_last_day.group_by(&:menu_item)
  end

end
