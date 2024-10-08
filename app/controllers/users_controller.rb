class UsersController < ApplicationController
  layout "auth"

  require_unauthenticated_access only: %i[ new create ]

  def new
    @user = User.new
  end

  def create
    @user = User.create!(user_params)
    start_new_session_for @user
    redirect_to root_url
  rescue ActiveRecord::RecordNotUnique
    redirect_to new_session_url(email_address: user_params[:email_address]), notice: "User already exists. Proceed to login..."
  end

  private

    def user_params
      params.require(:user).permit(:name, :username, :email_address, :password)
    end
end
