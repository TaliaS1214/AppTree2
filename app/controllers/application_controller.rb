class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:current_user_id]) if session[:current_user_id]
  end

  def authorize
    if session[:current_user_id] != params[:id]
      render json: {error: 'You are not authorized for that action.'}
    end
  end
end
