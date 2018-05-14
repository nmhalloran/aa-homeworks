class SessionsController < ApplicationController

  def index
    render :index
  end

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.find_by_credentials(params[:user][:email], params[:user][:password])
    if @user
      log_in_user!(@user)
      redirect_to user_url(@user)
    else
      redirect_to "/session/new"
    end

  end

  def destroy
    logout_user!

    redirect_to new_session_url
  end

end
