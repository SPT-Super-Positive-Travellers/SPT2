class Admin::ItemGenresController < ApplicationController

  def index
    @genres = ItemGenre.all
    @genre = ItemGenre.new
  end

  def create
    genre = ItemGenre.new(item_genres_params)
    genre.save
    redirect_to admin_item_genres_path
  end

  def edit
    @genre = ItemGenre.find(params[:id])
  end

  def update
    genre = ItemGenre.find(params[:id])
    genre.update(item_genres_params)
    redirect_to admin_item_genres_path
  end

  private

  def item_genres_params
    params.require(:item_genre).permit(:name)
  end

end
