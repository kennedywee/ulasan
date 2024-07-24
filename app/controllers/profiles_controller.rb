class ProfilesController < ApplicationController
  before_action :set_user, only: %i[ edit update ]

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: "User was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end
  private
    def user_params
      params.require(:user).permit(:name, :email, :username, :password)
    end
    def set_user
      @user = Current.user
    end
end
