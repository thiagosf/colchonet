class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  delegate :current_user, :user_signed_in?, to: :user_session
  helper_method :current_user, :user_signed_in?
  protect_from_forgery with: :exception

  before_action do
    I18n.locale = params[:locale] || I18n.default_locale
  end


  def default_url_options
    { locale: I18n.locale }
  end

  def user_session
    UserSession.new(session)
  end

  def require_authentication
    unless user_signed_in?
      if params[:controller] != 'user_sessions' && params[:action] != 'new' 
        redirect_to new_user_sessions_path,
          alert: t('flash.alert.needs_login')
      end
    end
  end

  def require_no_authentication
    unless user_signed_in?
      redirect_to root_path,
        notice: t('flash.notice.already_logged_in')
    end
  end
end