class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "You have successfully signed up"
      redirect_to users_path
    else
      render 'new'
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:username, :email, :public_key, :password)
  end
end