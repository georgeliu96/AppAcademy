class SessionsController < ApplicationController 
  
  before_action :ensure_no_resignup, except: :destroy 
  
  def new 
    render :new 
  end 

  def create 
    user = User.find_by_credentials(params[:user][:email], params[:user][:password])
    if user 
      login!(user)
      redirect_to bands_url 
    else 
      flash.now[:errors] = ["Invalid username/password"]
      render :new 
    end 
  end 

  def destroy
    logout! 
    redirect_to new_session_url
  end 

end 