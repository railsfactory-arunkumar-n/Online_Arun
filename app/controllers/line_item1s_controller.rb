class LineItem1sController < ApplicationController
  # GET /line_item1s
  # GET /line_item1s.json
  def index
    @line_item1s = LineItem1.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @line_item1s }
    end
  end

  # GET /line_item1s/1
  # GET /line_item1s/1.json
  def show
    @line_item1 = LineItem1.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @line_item1 }
    end
  end

  # GET /line_item1s/new
  # GET /line_item1s/new.json
  def new
    @line_item1 = LineItem1.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @line_item1 }
    end
  end

  # GET /line_item1s/1/edit
  def edit
    @line_item1 = LineItem1.find(params[:id])
  end

  # POST /line_item1s
  # POST /line_item1s.json
  def create
    #@line_item1 = LineItem1.new(params[:line_item1])
     @cart = current_cart
         p   111111111111111111111111111111
         #a= params
       #  p params[:line_item1]
         #a  =params[:line_item1][:product_id]
         
      product = Product.find(params[:product_id])
    #@line_item1 = @cart.line_item1s.build(:product => product)
    p 11111111111111111111111111111111111111111111111111111
    p product.id
    p product.name
    @line_item1= @cart.add_product(product.id)


    respond_to do |format|
      if @line_item1.save
        format.html { redirect_to(@line_item1.cart,
          :notice => 'Line item was successfully created.' ) }

        #format.html { redirect_to @line_item1, :notice => 'Line item1 was successfully created.' }
        format.json { render :json => @line_item1, :status => :created, :location => @line_item1 }
      else
        format.html { render :action => "new" }
        format.json { render :json => @line_item1.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /line_item1s/1
  # PUT /line_item1s/1.json
  def update
    @line_item1 = LineItem1.find(params[:id])

    respond_to do |format|
      if @line_item1.update_attributes(params[:line_item1])
        format.html { redirect_to @line_item1, :notice => 'Line item1 was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @line_item1.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /line_item1s/1
  # DELETE /line_item1s/1.json
  def destroy
    @line_item1 = LineItem1.find(params[:id])
    @line_item1.destroy

    respond_to do |format|
      format.html { redirect_to line_item1s_url }
      format.json { head :no_content }
    end
  end
end
