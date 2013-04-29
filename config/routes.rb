App7::Application.routes.draw do
  match '/payments/payment/:id', :to => 'payments#payment', :as => 'paymentspayment', :via => [:get]

  match '/payments/thank_you', :to => 'payments#thank_you', :as => 'payments_thank_you', :via => [:get]

  #match '/5_w5cj663_hpqgs/payment', :to => '5_w5cj663_hpqg#payment', :as => '5_w5cj663_hpqgpayment', :via => [:get]

  #match '/5_w5cj663_hpqgs/thank_you', :to => '5_w5cj663_hpqg#thank_you', :as => '5_w5cj663_hpqg_thank_you', :via => [:get]

  resources :orders


  resources :line_item1s


  resources :carts


  resources :line_items


  #get "cart/index"

  #get "admin/index"
  get "store/index"
  #get 'products'=>"products#index"
  
  #get 'new_user' => "users#new"
  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end
   #match 'forgot_password '=>'users#users ',:as=>'forgot_password'
  #get 'sessions' => 'sessions#destroy'
   
    resources :users do
    collection do
    get :forgot_password   #the account-email submisison form url
    post :reset_password  #a url for the function that sends the response email
  end
end
  controller :users do
    get 'forgot_password' => :forgot_password
    match '/auth/:provider/callback'=>'sessions#facebook_login'
 
  end
  
  resources :users
  #resources :stores


  resources :products


  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
   #get 'users/forgot_password' => 'sessions#forgot_password'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'store#index', :as => 'store'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'

end