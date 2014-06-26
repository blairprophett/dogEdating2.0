Rails.application.routes.draw do
  #overrides default devise controllers
  devise_for :users, :controllers => { :registrations => "registrations" }

  root 'sites#landing'

  get '/contact', to: 'sites#contact'
  get '/about', to: 'sites#about'

  post '/messages', to: 'conversations#send_msg'
  get '/messages', to: 'conversations#new_msg'
  get '/messages/inbox', to: 'conversations#inbox'
  get '/message/:id', to: 'conversations#show'

  resources :dogs, only: [:new, :create, :destroy, :show] do 
    resources :favorites, only: [:create] do
    end
  end

  resources :parks, only: [:index, :search, :show, :create]

  get '/search', to: 'parks#search'
end