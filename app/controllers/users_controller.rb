class UsersController < ApplicationController
  def index
  end

  def new
  end

  def create
    @user = User.new({
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    })
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @user = User.find_by(id: session[:user_id])
    @user.first_name = params[:first_name]
    @user.last_name = params[:last_name]
    @user.email = params[:email]
    if @user.save
      redirect_to '/profile'
    else
      render :edit
    end
  end

  def destroy
    User.find_by(id: session[:user_id]).destroy
    session.delete(:user_id)
    redirect_to '/'
  end
end
