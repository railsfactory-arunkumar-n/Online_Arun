class ApplicationController < ActionController::Base
  
  before_filter :authorize
  protect_from_forgery
 private
  def current_cart
    Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
    cart = Cart.create
    session[:cart_id] = cart.id
    cart
  end
  
  
 protected
    def authorize
      unless User.find_by_id( session[:user_id] )
      redirect_to login_url, :notice => "Please log in"
    end
  end
  
  
    def user_authorize
     
     p 22222222223333333333333333333333
     
     p  find=User.find_by_id( session[:user_id] )

     p 33333333333
     
     p find.roles 
    # p 55555555555
     p 4444444444444
     #(find.roles=='admin')? redirect_to products_path : redirect_to store_path
       p 555555
       
       unless(find.roles=='admin')

          redirect_to store_path
      
       p 555555
       
       
       end 
       
    end
end
