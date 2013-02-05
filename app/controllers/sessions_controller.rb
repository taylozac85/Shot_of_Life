class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_user_email(params[:session][:user_email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_back_or user
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end
	
  def destroy
    sign_out
    redirect_to root_url
  end
end
