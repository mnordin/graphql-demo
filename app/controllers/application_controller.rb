class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= find_session_user
  end
  helper_method :current_user

  private

  def find_session_user
    User.find_by(id: session[:user_id])
  end
end
