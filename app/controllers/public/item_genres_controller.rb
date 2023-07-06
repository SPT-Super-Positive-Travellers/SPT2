class Public::ItemGenresController < ApplicationController

  def search
    @genre = ItemGenre.find(params[:id])
    @genres = ItemGenre.all

  end
end
