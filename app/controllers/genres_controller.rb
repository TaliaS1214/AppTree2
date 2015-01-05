class GenresController < ApplicationController

  def index
    @genres = Genre.order(:name)
  end

  def create
  end

  def show
    @genre = Genre.find(params[:id])
  end

  def destroy
  end

end
