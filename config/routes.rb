Rails.application.routes.draw do
  devise_for :users
  root to: "spots#index"
  resources :spots, only: [:index, :show, :create, :new, :edit, :update] do
    resources :bookmarks, only: [:create]
  end
  resources :bookmarks, only: [:index, :delete]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
