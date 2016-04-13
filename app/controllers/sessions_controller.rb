class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash[:notice] = "Email/password pair not found."
      redirect_to '/login'
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to '/'
  end
end
