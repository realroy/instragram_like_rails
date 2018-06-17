Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pictures#index'
  resources :pictures do
    member do
      put 'like', to: 'pictures#like'
    end
  end
end
