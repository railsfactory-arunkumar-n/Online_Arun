class PaymentsController < ApplicationController

  layout 'authorize_net'
  helper :authorize_net
  protect_from_forgery :except => :relay_response

  # GET
  # Displays a payment form.
  def payment
    
    @cart = Cart.find(params[:id])
    @amount = @cart.total_price
    if(@amount>0)
      
      @sim_transaction = AuthorizeNet::SIM::Transaction.new(AUTHORIZE_NET_CONFIG['api_login_id'], AUTHORIZE_NET_CONFIG[                 'api_transaction_key'], @amount, :hosted_payment_form => true)  
    @sim_transaction.set_hosted_payment_receipt(AuthorizeNet::SIM::HostedReceiptPage.new(:link_method => AuthorizeNet::SIM::HostedReceiptPage::LinkMethod::GET, :link_text => 'Continue', :link_url => payments_thank_you_url(:only_path => false)))
    
    
    else
      redirect_to store_url, :notice => "Your cart is empty"
    end
  end
  
  # GET
  # Displays a thank you page.
  def thank_you
    p name=params[:x_first_name ]
   p email=params[:x_email]
    p address =params[:x_address]
    @order= Order.create( :name => name , :address => address , :email =>email , :pay_type =>'creditcart')
     
     #@order = Order.new(order)
     @order.add_line_items_from_cart(current_cart)
    p @auth_code = params[:x_auth_code]
    Cart.destroy(session[:cart_id])
          session[:cart_id] = nil
          Notifier.order(email).deliver
     
  end

end