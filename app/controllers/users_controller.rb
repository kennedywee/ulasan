class UsersController < ApplicationController
  allow_unauthenticated_access

  def new
    @user = User.new
  end

  def create
    @user = User.create!(user_params)
  end

  private

    def user_params
      params.require(:user).permit(:name, :username, :email_address, :password)
    end
end
