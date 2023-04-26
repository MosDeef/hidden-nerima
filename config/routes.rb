Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'users/registrations' }

  root to: "spots#index"
  resources :spots, only: [:index, :show, :create, :new, :edit, :update] do
    resources :bookmarks, only: [:create]
    resources :reviews, only: [:create, :show]
  end
  resources :bookmarks, only: [:index, :destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
