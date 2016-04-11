class SessionsController < ApplicationController
  def new
  end

  def create
    @bad_login = false
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      @bad_login = true
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to '/'
  end
end
