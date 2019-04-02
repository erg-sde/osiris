Rails.application.routes.draw do
  devise_for :users
  resources :batch
  resources :location
  resources :variety
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  unauthenticated do
    root to: 'sessions#create'
  end

  authenticated do
    root to: 'sessions#create'
    resources :varieties
  end
end
