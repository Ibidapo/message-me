class UsersController < ApplicationController
  before_action :logged_in_redirect, only: [:new, :create]
  before_action :set_user, except: [:new, :create]
  before_action :require_user, except: [:new, :create]
  before_action :require_same_user, only: [:edit, :update]

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
      flash.now[:error] = "Invalid credentials"
      render 'new'
    end
  end

  def show; end

  def edit; end

  def update
    if @user.update(update_params)
      flash[:success] = "Your profile updated successfully"
      redirect_to user_path(@user)
    else
      flash[:error] = "Something went wrong :("
      render 'edit'
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end

  def update_params
    params.require(:user).permit(:avatar, :interest)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def require_same_user
    unless logged_in? && (current_user == @user)
      flash[:error] = "Access denied"
      redirect_to root_path
    end
  end
end
