class UsersController < ApplicationController

  def create
    user = User.new(user_params)
    if user.save
      render json: user.safe_json, status: 200
    else
      render plain: user.errors.full_messages.first, status: 400
    end
  end

  def update
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :phone_number, :password, :password_confirmation)
  end
end
