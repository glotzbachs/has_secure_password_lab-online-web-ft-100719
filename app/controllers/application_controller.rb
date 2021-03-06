class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id])
  end

  def logged_in
    !!current_user
  end

  def authentication_required
    if logged_in?
      redirect_to '/login'
    end
  end

end
