class UsersController < ApplicationController
  before_action :logged_in_redirect, except: [:show, :edit]
  before_action :set_user, only: [:show, :edit]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Welcome to MessageMe! #{@user.username}"
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def show; end

  def edit
    
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
