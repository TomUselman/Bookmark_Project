BookmarkProject1::Application.routes.draw do
  get "sessions/new"

  resources :bookmarks
  resources :users
  resources :sessions, :only => [:new, :create, :destroy]
  
  match "/about" => "users#help"
  match "/contact" => "users#contact"
  
  match "/login" => "users#show"
  match "/display/:id" => "bookmarks#display"
  match '/upload'          => 'users#upload_avatar'
  match "/logout" => "users#logout"
  match "/edit" => "users#edit"
  match "/help" => "users#help"
  match "/bookmark" => "bookmark#show"
  match "/bookmarkedit" => "bookmark#edit"
  match '/signup',  :to => 'users#new'
  match '/signin',  :to => 'sessions#new'
  match '/signout', :to => 'sessions#destroy'
  root :to => "sessions#new"
end
