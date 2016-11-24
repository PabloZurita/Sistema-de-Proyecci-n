Rails.application.routes.draw do

  devise_for :users
  resources :payments
  resources	:vista2
  root 'vista2#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_scope :user do
    authenticated :user do
      root :to => 'vista2#index'
    end

    unauthenticated :user do
      root :to => 'devise/sessions#new', as: :unauthenticated_root
      #'devise/sessions#new'
    end

	end
end