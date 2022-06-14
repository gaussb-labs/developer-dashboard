class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      flash[:notice] = "Logged in successfully"
      redirect_to user
    else
      flash.now[:alert] = "Please check your credentials and try again"
      render 'new'
    end
  end

  def destroy

  end
end