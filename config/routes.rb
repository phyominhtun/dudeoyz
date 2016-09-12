Rails.application.routes.draw do
  
  resources :supports

  get 'admin/index', as: :admin
  get 'admin/index/user' => 'admin#user', as: :admin_user
  get 'admin/index/url' => 'admin#url', as: :admin_url
  get 'admin/index/visit' => 'admin#visit', as: :admin_visit

  devise_for :users
  root 'pages#home'

  get '/' => 'pages#home'
  get '/about' => 'pages#about', as: :about

  resources :urls

  get '/:id' => 'urls#show', as: :urlshow
  get '/:random_id/+' => 'urls#detailshow', as: :detailshow
  get '/:id/edit' => 'urls#edit'

  devise_scope :user do
    get 'u/login' => 'devise/sessions#new', as: :login
    get 'u/signup' => 'devise/registrations#new', as: :signup
    get 'u/settings' => 'devise/registrations#edit', as: :usersettings
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
