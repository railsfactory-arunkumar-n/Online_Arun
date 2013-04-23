class AdminController < ApplicationController
  def index
    #@users=User.all
    @user=User.find_by_id( session[:user_id])
   # @user1=@users.all
  end
end
