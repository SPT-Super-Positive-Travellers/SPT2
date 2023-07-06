class Admin::OrderItemsController < ApplicationController

  def update
    order_item = OrderItem.find(params[:id])
    order      = order_item.order
    OrderItem.transaction do
      order_item.update(order_item_params)
      if order_item.status == "making"
        order.update(status: 2)
      elsif order.order_items.count == order.order_items.where(status: "complete").count
        order.update(status: 3)
      end
    end
      flash[:notice] = "updated order status successfully"
      redirect_to admin_order_path(order)
    rescue => e
      flash[:alert] = "failed update"
      redirect_to admin_order_path(order)
  end

  private

  def order_item_params
    params.require(:order_item).permit(:status)
  end
end
