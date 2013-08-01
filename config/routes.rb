Soccer1::Application.routes.draw do
  
get "home/index"

devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

devise_scope :user do
  get 'sign_in', :to => 'devise/sessions#new', :as => :new_user_session
  get 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
end

root :to => "home#index"

#rest  
resources :home, :only => [:index]


end
