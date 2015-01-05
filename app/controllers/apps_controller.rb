class AppsController < ApplicationController

  def index
    # Default Apps - Will Be Changed to Top This Week
    @apps = App.all
  end

  def create
  end

  def show
  end

  def update
  end

end
