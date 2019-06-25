class UsersController < ApplicationController
  def show
    @user = current_user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(valid_params)
    if @user.save
      redirect_to new_session_path
    else
      render :new
    end
  end

  private

  def valid_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
