class UsersController < ApplicationController 

  before_action :ensure_logged_in, except: %i(new create)

  def index
    @users = User.all 
    render :index 
  end 

  def show 
    @user = User.find_by(id: params[:id])
    if @user 
      render :show 
    else 
      flash.now[:errors] = ["No such user exists!"]
      render :index 
    end 
  end 

  def new 
    @user = User.new 
    render :new 
  end 

  def edit 
    @user = User.find_by(id: params[:id])
    render :edit 
  end 

  def update
    @user = User.find_by(id: params[:id])
    if @user 
      @user.update!(params)
      render :show 
    else 
      flash.now[:errors] = ["No such user exists!"]
      redirect_to users_url
    end 
  end 

  def create 
    @user = User.new(user_params)

    if @user.save 
      login!(@user)
      redirect_to bands_url
    else 
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end 
  end 

  # def destroy 
  #   @user = User.find_by(params[:id])
  #   if @user 
  #     @user.destroy 
  #   else 
  #     flash.now[:errors] = ["Invalid params!"]
  #     redirect_to users_url
  #   end 
  # end 

  private 
  def user_params 
    params.require(:user).permit(:email, :password)
  end 
end 