class SessionsController < ApplicationController 

    before_action :ensure_no_resignup, except: :destroy

    def new
        render :new 
    end
     
    def create 
        # debugger
        user = User.find_by_credentials(params[:user][:user_name], params[:user][:password])
        # debugger
        if user 
            # debugger
            login!(user)
            redirect_to cats_url 
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