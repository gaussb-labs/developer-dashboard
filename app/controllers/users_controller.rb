class UsersController < ApplicationController
  require 'open3'
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_user, only: [:edit, :update]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def new
    @user = User.new
  end

  def show

  end

  def index
    @user = User.all
  end

  def edit
  end

  def add_host
    respond_to do |format|
      format.html { render :'users/add_host' }
    end
  end

  def ssh
    @user = current_user
    @hostIP = params[:select_host]
    puts @user.username
    puts @user.public_key
    puts @hostIP
    script = "ssh ssh-user@#{@hostIP} \"bash -s\" < ./add_user.sh \"#{@user.username}\" \"#{@user.public_key}\""
    Open3.popen3(script) do |stdin, stdout, stderr|
      puts stdout.read
      puts stderr.read
    end
    @user_host = Host.find_by(hostIP: "#{@hostIP}")
    @user.hosts << @user_host
    respond_to do |format|
      format.html { render :'users/add_host' }
    end
  end

  def update
    if @user.update(user_params)
      flash[:notice] = 'Your account information was successfully updated'
      redirect_to @user
    else render 'edit'
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = 'You have successfully signed up'
      redirect_to @user
    else render 'new'
    end
  end

  def destroy
    @user.destroy
    session[:user_id] = nil
    flash[:notice] = 'Account and all associated host are successfully deleted'
    redirect_to users_path
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:username, :email, :public_key, :password)
  end

  def require_same_user
    if current_user != @user && !current_user.admin?
      flash[:alert] = 'You can only edit your own account'
      redirect_to @user
    end
  end
end
