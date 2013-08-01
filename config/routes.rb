Soccer1::Application.routes.draw do
  
devise_for :users, :skip => [:sessions], :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }


# only using omniauth for authentication, so added these session routes within user scope. 
# note that sessions was ALSO skipped in the normal devise resources.

devise_scope :user do
  get 'sign_in', :to => 'devise/sessions#new', :as => :new_user_session
  get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
end

root :to => "home#index"

#rest  
resources :home, :only => [:index]


end
