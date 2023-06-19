class Admin::ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
    @genres = ItemGenre.pluck(:name, :id)
  end

  def create
    item = Item.new(item_params)
    item.save
    redirect_to admin_items_path
  end

  def show
  end

  def edit
  end

  private

  def item_params
    params.require(:item).permit(:item_image,:name,:introduction,:item_genre_id,:price,:is_availabled)
  end
end
