class UsersController < ApplicationController
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

  def edit;end

  def update
    current_user.update_attributes(valid_params)
    redirect_to edit_user_path(current_user)
  end

  private

  def valid_params
    params.require(:user).permit(:email, :password, :password_confirmation,
                                 :active, :name, :avatar)
  end
end
