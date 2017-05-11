Rails.application.routes.draw do
  get 'welcome' => 'pages#home'
  get 'about_us' => 'pages#about_us'
  get 'sign_up' => 'pages#sign_up'
  get 'my_account' => 'pages#my_account'\

  get '/consumers/new'=> 'consumers#new'
  
  # For details on the DSL avail  able within this file, see http://guides.rubyonrails.org/routing.html
end
