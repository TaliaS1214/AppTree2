class GenresController < ApplicationController

  def index
    @genres = Genre.order(:name)
  end

  def create
  end

  def show
  end

  def destroy
  end

end
