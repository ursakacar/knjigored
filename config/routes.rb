Rails.application.routes.draw do
  resources :books, path: "knjige"
  resources :genres, path: "zanri"
  resources :authors, path: "avtorji"

  get '', to: redirect('/knjige')
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
