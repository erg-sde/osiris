Rails.application.routes.draw do
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  resources :line_item
  resources :order
  resources :customer
  resources :batch
  resources :location
  resources :variety
 
  unauthenticated do
    devise_scope :user do
      root to: "devise/sessions#new"
    end
  end

  authenticated do
    root to: 'variety#index'
  end
end
