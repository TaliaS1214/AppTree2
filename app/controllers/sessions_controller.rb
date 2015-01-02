class SessionsController < ApplicationController
  before_filter :authorize, only: [:destroy]

  def create
    user = User.find_by(email: params[:user_email])
    if user && user.authenticate(params[:user_password])
      session[:current_user_id] = user.id
      render json: user.safe_json
    else
      render json: {error: 'Incorrect email or password.'}
    end
  end

  def destroy
    session[:current_user_id] = nil
    render json: User.new.safe_json
  end
end
