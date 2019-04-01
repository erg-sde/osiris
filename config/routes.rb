Rails.application.routes.draw do
  devise_for :views
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  unauthenticated do
    get '/', to: redirect('/uc.html')
  end
 
 authenticated do
  #  root :to => 'dashboard#index'
 end
end
