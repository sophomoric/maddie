class UsersController < ApplicationController
  before_filter :authenticate_user!

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to :back
  end

  private

  def user_params
    params.require(:user).permit(:domain)
  end
end
