class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by_email(params[:email])
    
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to :root
    else
      redirect_to new_session_path, notice: 'Invalid Email or Password'
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to '/'
  end

end
