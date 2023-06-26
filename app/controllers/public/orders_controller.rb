class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @destinations = current_customer.destinations
  end

  def confirm
    @order = Order.new(order_params)
    if params[:order][:destination_option] == '0'
      @order.postal_code   = current_customer.postal_code
      @order.address       = current_customer.address
      @order.name          = current_customer.full_name
    elsif params[:order][:destination_option] == '1'
      if current_customer.destinations.present?
        des = Destination.find(params[:order][:destination_id])
        @order.postal_code = des.postal_code
        @order.address     = des.address
        @order.name        = des.name
      end
    elsif params[:order][:destination_option] == '2'
    else
      render 'new'
    end
    @cart_items         = current_customer.cart_items.all
    @order.delivery_fee = 800
    @order.customer_id  = current_customer.id
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      current_customer.cart_items.each do |cart|
        order_item          = OrderItem.new()
        order_item.order_id = @order.id
        order_item.item_id  = cart.item_id
        order_item.count    = cart.count
        order_item.price    = cart.item.with_tax_price
        order_item.save
      end
    current_customer.cart_items.destroy_all
    redirect_to complete_orders_path
  end
  end

  def complete
  end

  def index
    @orders = current_customer.orders.all
  end

  def show
  end

  private

  def order_params
    params.require(:order).permit(:postal_code,
                                  :address,
                                  :name,
                                  :payment,
                                  :amount_billed,
                                  :customer_id,
                                  :delivery_fee
                                  )
  end

end
