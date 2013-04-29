class SessionsController < ApplicationController
  skip_before_filter :authorize , :only =>[:new , :create,:facebook_login]
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
  def facebook_login
   
  auth = request.env["omniauth.auth"]
  p auth 
  
  
   
   p auth['uid']
   # :role => uid
   # string => provoider name
  user = User.where(:string => auth['provider'], 
                    :role=> auth['uid']).first || User.create_with_omniauth(auth)
  
  session[:user_id] = user.id
  redirect_to store_index_url, :notice => "Signed in!#{user.name}"
end

end
