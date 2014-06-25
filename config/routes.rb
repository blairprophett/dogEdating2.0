Rails.application.routes.draw do
  #overrides default devise controllers
  devise_for :users, :controllers => { :registrations => "registrations" }

  root 'sites#landing'

  get '/contact', to: 'sites#contact'
  get '/about', to: 'sites#about'

  post '/messages', to: 'conversations#send_msg'
  get '/messages', to: 'conversations#new_msg'
  get '/messages/inbox', to: 'conversations#inbox'

  resources :dogs do 
    resources :favorites do
      post :add_from_yelp, on: :collection
    end
  end

  resources :parks

  get '/search', to: 'parks#search'
end


#                      Prefix Verb   URI Pattern                                     Controller#Action
#            new_user_session GET    /users/sign_in(.:format)                        devise/sessions#new
#                user_session POST   /users/sign_in(.:format)                        devise/sessions#create
#        destroy_user_session DELETE /users/sign_out(.:format)                       devise/sessions#destroy
#               user_password POST   /users/password(.:format)                       devise/passwords#create
#           new_user_password GET    /users/password/new(.:format)                   devise/passwords#new
#          edit_user_password GET    /users/password/edit(.:format)                  devise/passwords#edit
#                             PATCH  /users/password(.:format)                       devise/passwords#update
#                             PUT    /users/password(.:format)                       devise/passwords#update
#    cancel_user_registration GET    /users/cancel(.:format)                         registrations#cancel
#           user_registration POST   /users(.:format)                                registrations#create
#       new_user_registration GET    /users/sign_up(.:format)                        registrations#new
#      edit_user_registration GET    /users/edit(.:format)                           registrations#edit
#                             PATCH  /users(.:format)                                registrations#update
#                             PUT    /users(.:format)                                registrations#update
#                             DELETE /users(.:format)                                registrations#destroy
#                        root GET    /                                               sites#landing
#                     contact GET    /contact(.:format)                              sites#contact
#                       about GET    /about(.:format)                                sites#about
# add_from_yelp_dog_favorites POST   /dogs/:dog_id/favorites/add_from_yelp(.:format) favorites#add_from_yelp
#               dog_favorites GET    /dogs/:dog_id/favorites(.:format)               favorites#index
#                             POST   /dogs/:dog_id/favorites(.:format)               favorites#create
#            new_dog_favorite GET    /dogs/:dog_id/favorites/new(.:format)           favorites#new
#           edit_dog_favorite GET    /dogs/:dog_id/favorites/:id/edit(.:format)      favorites#edit
#                dog_favorite GET    /dogs/:dog_id/favorites/:id(.:format)           favorites#show
#                             PATCH  /dogs/:dog_id/favorites/:id(.:format)           favorites#update
#                             PUT    /dogs/:dog_id/favorites/:id(.:format)           favorites#update
#                             DELETE /dogs/:dog_id/favorites/:id(.:format)           favorites#destroy
#                        dogs GET    /dogs(.:format)                                 dogs#index
#                             POST   /dogs(.:format)                                 dogs#create
#                     new_dog GET    /dogs/new(.:format)                             dogs#new
#                    edit_dog GET    /dogs/:id/edit(.:format)                        dogs#edit
#                         dog GET    /dogs/:id(.:format)                             dogs#show
#                             PATCH  /dogs/:id(.:format)                             dogs#update
#                             PUT    /dogs/:id(.:format)                             dogs#update
#                             DELETE /dogs/:id(.:format)                             dogs#destroy
#                       parks GET    /parks(.:format)                                parks#index
#                             POST   /parks(.:format)                                parks#create
#                    new_park GET    /parks/new(.:format)                            parks#new
#                   edit_park GET    /parks/:id/edit(.:format)                       parks#edit
#                        park GET    /parks/:id(.:format)                            parks#show
#                             PATCH  /parks/:id(.:format)                            parks#update
#                             PUT    /parks/:id(.:format)                            parks#update
#                             DELETE /parks/:id(.:format)                            parks#destroy
#                      search GET    /search(.:format)                               parks#search