class SessionsController < ApplicationController
  skip_before_filter :authorize , :only =>[:new , :create]
  #@user =User.all
  def new
  end

  def create
     @user =User.all
     
      if user = User.authenticate(params[:name], params[:password])
        
        session[:user_id] = user.id
        session[:user_role] = user.roles
        session[:user_name]=user.name
        
       
        if session[:user_role] == "admin"
         
					redirect_to products_url
        else
				 redirect_to store_url
			  end
			else
        redirect_to login_url, :notice => "Invalid user/password combination"
      end
    end
  #end
  def destroy
    session[:user_id] = nil
    session[:user_role] =nil
    session[:user_name] =nil
    redirect_to login_url, :notice => "Logged out"
  end
end
