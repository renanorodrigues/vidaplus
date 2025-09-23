Rails.application.routes.draw do
  get "auth/signin"
  get "auth/signup"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  namespace :api do
    namespace :v1 do
      resources :usuarios
      resources :administradores
      resources :unidade_medicas
      resources :agendas
      resources :profissionais do
        resources :receitas, only: :create
      end
      resources :pacientes do
        resources :prontuarios, only: :create
        resources :pedidos do
          resources :consultas, only: %i[create show update]
        end
      end
    end
  end
end
