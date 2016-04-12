class UsersController < ApplicationController
  def index
  end

  def new
  end

  def create
    @email_taken = false
    @password_mismatch = false
    if !User.find_by(email: params[:email])
      user = User.new({
        first_name: params[:first_name],
        last_name: params[:last_name],
        email: params[:email],
        password: params[:password],
        password_confirmation: params[:password_confirmation]
      })
      if user.save
        session[:user_id] = user.id
        redirect_to user_path(user)
      else
        @password_mismatch = true
        render :new
      end
    else
      @email_taken = true
      render :new
    end
  end

  def show
  end

  def edit
  end

  def destroy
    User.find_by(id: session[:user_id]).destroy
    session.delete(:user_id)
    redirect_to '/'
  end
end
