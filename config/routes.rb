Rails.application.routes.draw do
  resources :memberships, only: %i[create index]
  resources :clients, only: %i[index show update]
  resources :gyms
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
