class ApplicationController < ActionController::Base

  add_flash_types :success, :warning, :danger, :info, :error, :primary

  include SessionsHelper

  helper_method :admin?

  def authorize
    unless admin?
      redirect_to root_path
      false
    end
  end

  def admin?
    logged_in? && current_user.admin?
  end

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

  def correct_user
    @user = User.find(session[:user_id])
    redirect_to(root_url) unless @user == current_user
  end

end
