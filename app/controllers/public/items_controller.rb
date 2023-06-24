class Public::ItemsController < ApplicationController

  def index
    @items = Item.all
    @genres = ItemGenre.all
  end

  def show
    @item = Item.find(params[:id])
    @genres = ItemGenre.all
    @cart_item = CartItem.new
  end
end
