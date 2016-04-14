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
      flash[:notice] = "An error occurred. Please make sure the email does not already have an account associated with it and that the passwords match."
      redirect_to '/users/new'
    end
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def edit
  end

  def update
    @user = User.find_by(id: session[:user_id])
    @user.first_name = params[:first_name]
    @user.last_name = params[:last_name]
    @user.email = params[:email]
    if @user.save
      redirect_to user_path(@user)
    else
      flash[:notice] = 'That email is already associated with a different account.'
      redirect_to user_edit_path(@user)
    end
  end

  def destroy
    user = User.find_by(id: session[:user_id])
    # deletes membership for all projects
    user.project_members.each do |membership|
      membership.destroy
    end
    if user.destroy
      session.delete(:user_id)
      redirect_to '/'
    end
  end
end
