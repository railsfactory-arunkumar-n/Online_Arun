class UsersController < ApplicationController
  # GET /users
  # GET /users.json
   skip_before_filter :authorize , :only => [:new,:create,:forgot_password,:reset_password]
  def index
    # @users = User.all
     @users = User.order(:name)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    #@users = User.find(params[:id])
    @user=User.find_by_id( session[:user_id])
     @user.save
      respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    p 111111111111
    p params
    p 222222222222
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to users_url, :notice => 'User #{@user.name} was successfully created.' }
        format.json { render :json => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.json { render :json => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, :notice => 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
  def forgot_password
   
 end
 def reset_password
   p 777777777777777777777777777777777777777777777777777777
   p params
   p params[:user]
   email_id=params[:user][:email]
  p username=params[:user][:text]
  #a=Random.rand(10..100)
  # puts (rand() * 1000).to_i
   code = (rand() * 1000).to_i
   p code
   @code =code
   @user=User.find_by_name(username)
   #p 111111111111111111111111111111111111111111111111111
   p @user
    p @user.name
    p @user.email_id
    p email_id
   #P  111111111111111111111111111111111111111111111111111
   if(@user.name)
     if(@user.email_id==email_id)
         Notifier.forgot_password(@emai_id,code).deliver
      end
      respond_to do |format|
      format.html { redirect_to edit_user_url(@user.id) }
      format.json { head :no_content }
    end 
  end 
 
  
   end
end
