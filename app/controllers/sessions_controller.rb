class SessionsController < ApplicationController
  allow_unauthenticated_access only: %i[ new create ]

  before_action :ensure_user_exists, only: :new

  def new
  end

  def create
    if user = User.active.authenticate_by(email_address: params[:email_address], password: params[:password])
      start_new_session_for user
      redirect_to post_authentication_url
    else
      render_rejection :unauthorized
    end
  end

  def destroy
    reset_authentication

    redirect_to root_url
  end

  private
    def ensure_user_exists
      redirect_to new_user_url if User.none?
    end

    def render_rejection(status)
      flash[:alert] = "Too many requests or unauthorized."
      render :new, status: status
    end
end
