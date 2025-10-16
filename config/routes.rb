Rails.application.routes.draw do
  get "auth/signin"
  get "auth/signup"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  
  namespace :api do
    namespace :v1 do
      resources :auditorias, only: %i[index show]
      resources :usuarios
      resources :administradores
      resources :unidade_medicas do
        resources :profissionais, only: :create
      end
      resources :profissionais do
        resources :agendas
        resources :receitas, only: :create
        resources :prontuarios, only: :create
      end
      resources :pacientes do
        resources :consultas
      end
    end
  end
end
