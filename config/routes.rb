Rails.application.routes.draw do
  devise_for :users
  resources :user_stories
  root to: 'user_stories#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
