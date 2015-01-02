class GenresController < ApplicationController

  def index
    render json: Genre.order(:name).to_json, status: 200
  end

  def create
  end

  def show
  end

  def destroy
  end

end
