class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # For now all calls are authenticated using `#first_user`
  def current_user
    @current_user ||= first_user
  end

  private

  def first_user
    User.first
  end
end
