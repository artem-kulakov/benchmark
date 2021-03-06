Benchmark::Application.routes.draw do
  get 'password_resets/new'

  get 'password_resets/edit'

  root 'reports#index'
  
  get 'signup' => 'users#new'

  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  resources :units
  resources :fx_rates
  resources :currencies
  resources :days
  resources :gaaps
  resources :approvals
  resources :versions
  resources :formulas
  resources :values

  get 'reports/:id/amend' => 'reports#amend', as: :amend_report
  get 'reports/check' => 'reports#check', as: :check

  resources :reports

  match 'indicators/all/edit' => 'indicators#edit_all', :as => :edit_all, :via => :get
  match 'indicators/all' => 'indicators#update_all', :as => :update_all, :via => :put

  resources :indicators
  resources :periods
  resources :companies
  resources :industries
  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :topics
  resources :posts

  get 'chart' => 'reports#chart'
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end
  
  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
