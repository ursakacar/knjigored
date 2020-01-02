Rails.application.routes.draw do
  resources :books, path: "knjige"
  resources :genres, path: "zanri"
  resources :authors, path: "avtorji"
  resources :sessions, only: [:create, :new]

  get '', to: redirect('/knjige')

  resources :sessions, only: [:create, :new] do
    collection do
      get :logout
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
