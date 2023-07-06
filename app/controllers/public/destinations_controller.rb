class Public::DestinationsController < ApplicationController

  def index
    @destinations = current_customer.destinations.all
    @destination = Destination.new
  end

  def create
    des = Destination.new(des_params)
    des.customer_id = current_customer.id
    des.save
    redirect_to destinations_path
  end

  def edit
    @destination = Destination.find(params[:id])
  end

  def update
    Destination.find(params[:id]).update(des_params)
    redirect_to destinations_path
  end

  def destroy
    Destination.find(params[:id]).destroy
    redirect_to destinations_path
  end

  private

  def des_params
    params.require(:destination).permit(:customer_id,
                                        :name,
                                        :address,
                                        :postal_code
                                        )
  end
end
