class SearchesController < ApplicationController

  def create
    apps_hash = AppStore.search(params[:query])
  end

end
