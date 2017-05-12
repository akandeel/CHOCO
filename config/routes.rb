Rails.application.routes.draw do
  get 'welcome' => 'pages#home'
  get 'about_us' => 'pages#about_us'
  get 'sign_up' => 'pages#sign_up'
  get 'my_account' => 'pages#my_account'

  get '/consumers/:id/edit' => 'consumers#edit' as: :edit_consumer
  patch '/consumers/:id' => 'consumers#update' as: :update_consumer
  
  #get '/consumers/:id' => 'consumers#show'
  #get '/consumers/:id' => 'consumers#edit'

  # get '/consumers/new'=> 'consumers#new'
  resources :consumers

  # For details on the DSL avail  able within this file, see http://guides.rubyonrails.org/routing.html
end
