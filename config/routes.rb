Rails.application.routes.draw do
  resources :vendas
  devise_for :corretores
  devise_for :clientes
  get "home/index"
  resources :solicitacoes
  resources :imoveis
  resources :corretores
  resources :clientes

  get "up" => "rails/health#show", as: :rails_health_check

  root to: "home#index"
end
