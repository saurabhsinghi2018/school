class SessionsController < ApplicationController

  def new
    if logged_in?
       redirect_to welcome_path
       flash[:danger] = "You're already logged in"
    end
  end

  def create
     user = User.find_by(email: params[:session][:email].downcase)
     if user && user.authenticate(params[:session][:password])
       log_in user
      redirect_to welcome_path
     else
       flash[:danger] = 'Invalid email/password combination'
       render 'new'
     end
   end

  def destroy
    log_out
    redirect_to root_url
  end

end
