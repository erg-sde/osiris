Rails.application.routes.draw do
  devise_for :users
  resources :batch
  resources :location
  resources :variety
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  unauthenticated do
    devise_scope :user do
      root to: "devise/sessions#new"
    end
  end

  authenticated do
    root to: 'variety#index'
  end
end
