class SessionsController < ApplicationController

  def new
  end

  def create
    if @user = User.authenticate_with_credentials(params[:email], params[:password])
      session[:user_id] = @user.id
      redirect_to :root

    else
      flash[:warning] = 'Invalid Email or Password'
      redirect_to [:new, :session]

    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to '/'
  end
end
