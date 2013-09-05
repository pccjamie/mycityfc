Soccer1::Application.routes.draw do
 
devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", :registrations => "users/registrations" }
get "users/edit", :to => "users/registrations#edit"

resources :home, :only => [:index, :splash]

root :to => 'home#splash'

resources :slides, :except => [:destroy]
resources :fan_profiles, :except => [:destroy]
resources :parent_profiles, :except => [:destroy]
resources :teams

end
