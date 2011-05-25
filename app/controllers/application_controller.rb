class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :require_login

  # todo: make method find proper user after auth logic is done.
  def current_user
    # @_current_user ||= session[:current_user_id] && User.find(session[:current_user_id])
    @user = User.first
  end

  private

  def require_login
    unless logged_in?
      flash[:error] = "Please login"
      redirect_to login_url
    end
  end

  def logged_in?
    !!current_user
  end
end
