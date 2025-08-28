Rails.application.routes.draw do
  resources :vendas

  devise_for :corretores, controllers: { sessions: 'corretores/sessions', registrations: 'corretores/registrations' },
    path_names: { sign_out: 'logout', sign_in: 'login', sign_up: 'cadastro' }
  devise_for :clientes, controllers: { sessions: 'clientes/sessions', registrations: 'clientes/registrations' },
    path_names: { sign_out: 'logout', sign_in: 'login', sign_up: 'cadastro' }


  get "home/index"
  get 'clientes/solicitacoes', to: 'solicitacoes#minhas_solicitacoes', as: :minhas_solicitacoes
  resources :solicitacoes do
    member do
      patch :aceitar
      patch :rejeitar
      patch :concluir
    end
  end

  resources :imoveis

  get 'corretores/solicitacoes', to: 'solicitacoes#em_andamento', as: :solicitacoes_em_andamento
  get 'corretores/captacoes', to: "imoveis#captacoes", as: :meus_imoveis
  get 'clientes/perfil', to: 'clientes#perfil', as: :perfil_cliente
  get 'corretores/perfil', to: 'corretores#perfil', as: :perfil_corretor

  resources :corretores
  resources :clientes, only: [:edit, :update, :destroy]


  get "up" => "rails/health#show", as: :rails_health_check

  root to: "home#index"
end
