Rails.application.routes.draw do
  root 'welcome#index'

  get 'login' => 'sessions#new'

  post 'login' => 'sessions#create'

  delete 'logout' => 'sessions#destroy'

  get 'projects' => 'projects#index'

  post 'project/new' => 'projects#create_project'

  get 'users/new'

  get 'users' => 'users#index'

  post 'users' => 'users#create'

  get 'users/:id/edit' => 'users#edit', as: :user_edit

  get 'users/:id' => 'users#show', as: :user

  patch 'users/:id' => 'users#update'

  delete 'users/:id' => 'users#destroy'

  post 'projects/:id/task/new' => 'projects#create_task'

  post 'tasks/:id/post/new' => 'projects#create_post'

  post 'tasks/:id/complete' => 'projects#complete_task', as: :task_complete

  delete 'task/:id/remove' => 'projects#remove_task', as: :task_remove

  post 'projects/:id/complete' => 'projects#complete_project', as: :project_complete

  delete 'projects/:id/remove' => 'projects#remove_project', as: :project_remove

  post 'projects/:id/invite' => 'projects#invite', as: :project_invite

  get 'projects/:id' => 'projects#show', as: :project

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
