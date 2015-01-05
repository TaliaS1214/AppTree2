class SessionsController < ApplicationController
  before_filter :authorize, only: [:destroy]

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:current_user_id] = user.id
      render json: user.safe_json, status: 200
    else
      render plain: 'Incorrect email or password. Try again.', status: 400
    end
  end

  def show
    render json: User.find(session[:current_user_id]).safe_json, status: 200
  end

  def destroy
    session[:current_user_id] = nil
    render nothing: true, status: 200
  end
end
