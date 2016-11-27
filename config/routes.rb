Rails.application.routes.draw do

  resources :indicadoresacumulados
  resources :indicadoresdiarios
  resources :respuesta
  resources :encuesta
  resources :motivos
  resources :pregunta
  resources :pagos
  resources :mdps
  resources :lineas
  resources :contratos
  resources :fijomovils
  resources :segmentos
  resources :clientes
  get 'conf/index'

  get 'graficos/index'

  get 'historico/index'

  get '/historico/index' => 'historico#index', as: 'historico'
  get '/graficos/index' => 'graficos#index', as: 'graficos'
  get '/conf/index' => 'conf#index', as: 'conf'
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