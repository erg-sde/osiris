Rails.application.routes.draw do
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  resources :line_items, :order,:customer,
            :batches, :location, :varieties,
            :line_item_batches
 
  unauthenticated do
    devise_scope :user do
      root to: "devise/sessions#new"
    end
  end

  authenticated do
    root to: 'varieties#index'
  end
end
