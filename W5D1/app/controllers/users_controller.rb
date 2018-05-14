class UsersController < ApplicationController

  def new
    @user = User.new

    render :new
  end

  def create
    @user = User.new(user_params)
    @user.password = params[:user][:password]
    if @user.save!
      log_in_user!(@user)
      redirect_to "/users/#{@user.id}"
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    render :show
  end

  private

  def user_params
    params.require(:user).permit(:email, :password_digest, :session_token)
  end


end
