class Public::MapsController < ApplicationController

  def index
    @maps = Map.all
  end

  def new
    @map = Map.new
  end

  def create
    map = Map.new(map_params)
    map.save
    redirect_to maps_path
  end

  def show
  end

  private

  def map_params
    params.require(:map).permit(:body,:lng,:lat)
  end
end
