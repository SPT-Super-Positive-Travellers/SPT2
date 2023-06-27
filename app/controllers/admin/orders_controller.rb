class Admin::OrdersController < ApplicationController
  
  def show
    @order = Order.find(params[:id])
    @total = @order.order_items.inject(0) { |sum, order_item| sum + order_item.total_price }
  end
end
