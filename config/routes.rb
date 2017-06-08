Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  resources :user_stories
  root to: 'user_stories#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'roles_demo', to: "roles_demo#index"
  get 'roles_demo/admin', to: "roles_demo#admin_only"
  get 'roles_demo/team', to: "roles_demo#team_only"
  get 'roles_demo/po', to: "roles_demo#po_only"
  get 'roles_demo/team_and_po', to: "roles_demo#team_and_po"


  devise_scope :user do get "/logout" => "user/sessions#destroy" end

end
