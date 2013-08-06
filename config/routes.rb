Soccer1::Application.routes.draw do
  
devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", :registrations => "users/registrations" }

get "users/:id/edit", :to => "users/registrations#edit"



#only using omniauth for authentication, so added these session routes within user scope. 
#note that sessions was ALSO skipped in the normal devise resources.

# devise_scope :user do
#   get 'sign_in', :to => 'devise/sessions#new', :as => :new_user_session
#   get 'sign_up', :to => 'devise/registrations#new'
#   get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
# end

resources :home, :only => [:index]
root :to => "home#index"

resources :slides


# resources :matches
# resources :profiles

end
