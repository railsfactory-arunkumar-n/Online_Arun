class CartController < ApplicationController
  def index
#=begin 
 p params[:pro] 
 @product = Product.find(params[:pro])
 

   # @user = User.find(params[:id])
   @product.save
      respond_to do |format|
      format.html 
      format.json { render :json => @user }
       end
      end
#=end
  
  
    
 
end
