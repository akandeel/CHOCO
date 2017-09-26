Rails.application.routes.draw do
  #get 'welcome' => 'pages#home'
  #get 'about_us' => 'pages#about_us'
  #get 'sign_up' => 'pages#sign_up'
  #get 'my_account' => 'pages#my_account'
  root :to => 'pages#home'

  #get 'about', to: 'pages#about_us'

  #get 'login' => 'sessions_consumers#new'

  resources :pages
  #resources :sessions_consumers


  #get '/consumers/:id/edit' => 'consumers#edit' as: :edit_consumer
  #patch '/consumers/:id' => 'consumers#update' as: :update_consumer

  #get '/consumers/:id' => 'consumers#show'
  #get '/consumers/:id' => 'consumers#edit'

  # get '/consumers/new'=> 'consumers#new'
  resources :users

  #get '/business_sign_up' => 'businesse#business_sign_up'
  #get '/dashboard' => 'businesse#business_dashboard'

  #get '/businesses/:id/edit' => 'businesses#edit'
  #patch '/businesses/:id' => 'businesses#update'
  #post 'businesse' => 'businesse#create'
  #get '/businesses/:id' => 'businesses#show'
  #get '/businesses/new' => 'businesses#new'
  resources :businesses
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # *****ACCOUNT ACTIVATION ROUTES*****

  resources :account_activations, only: [:edit]
end
