class AppsController < ApplicationController

  def index
    # Default Apps - Will Be Changed to Top This Week
    render json: App.all.to_json, status: 200
  end

  def create
  end

  def show
  end

  def update
  end

end
