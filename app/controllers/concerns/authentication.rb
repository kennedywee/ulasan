module Authentication
  extend ActiveSupport::Concern
  include SessionLookup

  included do
    before_action :require_aunthentication
    helper_method :signed_in?

    protect_from_forgery with: :exception, unless: -> { authenticated_by.bot_key? }
  end

  class_methods do
    def require_unauthenticated_access(**options)
      allow_unauthenticated_access **options
      before_action :redirect_signed_in_user_to_root, **options
    end

    def allow_unauthenticated_access(**options)
      skip_before_action :require_aunthentication, **options
      before_action :restore_authentication, **options
    end
  end

  private
    def signed_in?
      Current.user.present?
    end

    def require_aunthentication
      restore_authentication || request_aunthentication
    end

    def restore_authentication
      if session = find_session_by_cookie
        resume_session session
      end
    end

    def request_aunthentication
      session[:return_to_after_authenticating] = request.url
      redirect_to new_session_url
    end

    def redirect_signed_in_user_to_root
      redirect_to root_url if signed_in?
    end

    def start_new_session_for(user)
      user.sessions.start!(user_agent: request.user_agent, ip_address: request.remote_ip).tap do |session|
        authenticated_as session
      end
    end

    def resume_session(session)
      session.resume user_agent: request.user_agent, ip_address: request.remote_ip
      authenticated_as session
    end

    def authenticated_as(session)
      Current.user = session.user
      set_authentiate_by(:session)
      cookies.signed.permanent[:session_token] = { value: session.token, httponly: true, same_site: :lax }
    end

    def post_authentication_url
      session.delete(:return_to_after_authenticating) || root_url
    end

    def reset_authentication
      cookies.delete(:session_token)
    end

    def set_authentiate_by(method)
      @authenticate_by = method.to_s.inquiry
    end

    def authenticated_by
      @authenticate_by ||= "".inquiry
    end
end
