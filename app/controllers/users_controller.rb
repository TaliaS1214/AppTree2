class UsersController < ApplicationController

  def create
    user = User.new(user_params)
    if user.save
      render json: user.safe_json
    else
      render json: {error: 'Something went wrong.'}
    end
  end

  def show
  end

  def update
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :phone_number, :password, :password_confirmation)
  end
end
