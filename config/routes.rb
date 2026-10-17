Rails.application.routes.draw do
  resource :session
  resources :passwords, param: :token

  root to: "homes#top"

  get "home/about" => "homes#about", as: "about"

  resources :users,
            only: [:new, :create, :index, :show, :edit, :update],
            path_names: { new: "sign_up" }

  resources :books,
            only: [:index, :show, :create, :edit, :update, :destroy]
end