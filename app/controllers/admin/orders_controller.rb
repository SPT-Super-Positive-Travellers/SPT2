class Admin::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    @total = @order.order_items.inject(0) { |sum, order_item| sum + order_item.total_price }
    
  end

  def update
    @order      = Order.find(params[:id])
    @order_items = OrderItem.where(order_id: params[:id])
    @order.update(order_params)
    redirect_to admin_order_path(@order)
  end

  private

  def order_params
    params.require(:order).permit(:status)
  end
end
