class SearchesController < ApplicationController

  def create
    apps_hash = AppStore.search(params[:query])
    render json: apps_hash.to_json, status: 200
  end

end
