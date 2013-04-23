class StoreController < ApplicationController
  skip_before_filter :authorize 
  def index
    #@produts=Produts.all
    @products = Product.all
  end
  
end
