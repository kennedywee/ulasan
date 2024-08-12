class SessionsController < ApplicationController
  allow_unauthenticated_access only: %i[ new create omniauth ]

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

  def omniauth
    user = User.find_or_create_by(uid: request.env["omniauth.auth"]["uid"], provider: request.env["omniauth.auth"]["provider"]) do |u|
        u.name = request.env["omniauth.auth"]["info"]["name"]
        u.username = request.env["omniauth.auth"]["info"]["name"]
        u.email_address = request.env["omniauth.auth"]["info"]["email"]
        u.role = 0
        u.active = true
        u.password = SecureRandom.hex(10)
    end

    if user.persisted?
      start_new_session_for user
      redirect_to post_authentication_url
    else
      render :new
    end
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
