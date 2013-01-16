S4g::Application.routes.draw do

  devise_for :people,  :controllers => { :sessions => "sessions"}

  #scope :admin, :as => :admin, :constraints => { :subdomain => "admin" } do
  # resources :admin ,:controller => 'admin'
  #end
  resources :causes

  constraints(:subdomain => :admin) do
    scope :module => "admin" do
      resources :admins  do
        member do
          get :show_admin_dashboard
        end
        resources :causes

      end
    end
  end

  resources :users do
    member do
      get :display_cause
      post :save_causes
      get :display_businesses_of_causes
      post :save_business
      get :display_post
      get :display_dash_board_user

      get :get_businesses

      get :share_on_facebook
      get :sign_up_facebook
      get :sign_up
      get :callback
    end
  end

  resources :business_users do
    member do
      get :get_cause_to_business
      put :save_business_cause
      get :get_business_detail
      post :save_business_detail
    end
  end

  resources :business_companies do
    resources :posts, :only => [:create, :destroy]
    member do
      get :show_post
    end
  end

  #resource :static_pages do
  #  member do
  #    get :home
  #  end
  #end

  match '/user_signup',  :to => 'users#new', :as => 'user_sign_up'
  match '/first', :to => 'users#display_cause'

  match '/business_user_signup', :to => 'business_users#new', :as => 'business_user_sign_up'
  match '/business_details', to: 'business_users#get_business_detail', :as => 'business_details'

  match '/create_cause' , :to => 'causes#new'
  match '/index' ,  :to => 'causes#index'
  match '/create_cause' , :to => 'admin/causes#new ' , :as =>'create_cause'

  root :to => 'static_pages#home'

  #match '/', :to => 'static_pages#home'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
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


  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
