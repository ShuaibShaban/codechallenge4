Rails.application.routes.draw do
  resources :heroes, only: [:index, :show] do
    resources :powers, only: [:index]
  end

  resources :powers, only: [:index, :show, :update, :destroy]

  resources :hero_powers, only: [:create]
end