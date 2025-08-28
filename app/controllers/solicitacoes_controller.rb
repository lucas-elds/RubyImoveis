class SolicitacoesController < ApplicationController
  before_action :authenticate_corretor!, only: [:em_andamento, :aceitar, :rejeitar, :concluir, :destroy]
  before_action :authenticate_cliente!, only: [:index, :new, :create, :edit, :update, :destroy]
  before_action :set_solicitacao, only: [:aceitar, :rejeitar, :concluir, :destroy, :update]

  def new
    # Cria um objeto vazio para o form
    @solicitacao = Solicitacao.new(imovel_id: params[:imovel_id])
  end

  def create
    @solicitacao = current_cliente.solicitacoes.build(solicitacao_params)
    @solicitacao.status = "Em Aberto"

    if @solicitacao.save
      redirect_to imoveis_path, notice: "Solicitação criada com sucesso!"
    else
      render :new
    end
  end

  def edit
    @solicitacao = Solicitacao.find(params[:id])
  end

  def update
    @solicitacao = current_cliente.solicitacoes.find(params[:id])

    if @solicitacao.update(solicitacao_params)
      redirect_to minhas_solicitacoes_path, notice: "Solicitação atualizada com sucesso!"
    else
      render :edit
    end
  end

  def minhas_solicitacoes
    @solicitacoes = current_cliente.solicitacoes.includes(:imovel)
  end
  
  def em_andamento
    @solicitacoes = Solicitacao.joins(:imovel)
                               .where(imoveis: { corretor_id: current_corretor.id })
                               .includes(:cliente, :imovel)
  end

  def aceitar
    @solicitacao.update(status: "Aceita")
    redirect_to solicitacoes_em_andamento_path, notice: "Solicitação aceita."
  end
  

  def rejeitar
    @solicitacao.update(status: "Rejeitada")
    redirect_to solicitacoes_em_andamento_path, notice: "Solicitação rejeitada."
  end

  def concluir
    @solicitacao.update(status: "Concluída")
    redirect_to solicitacoes_em_andamento_path, notice: "Solicitação concluída."
  end

  def destroy
    if ["Rejeitada", "Concluída"].include?(@solicitacao.status)
      @solicitacao.destroy
      redirect_to solicitacoes_em_andamento_path, notice: "Solicitação excluída."
    else
      redirect_to solicitacoes_em_andamento_path, alert: "Só é possível excluir solicitações rejeitadas ou concluídas."
    end
  end

  private

  def set_solicitacao
    @solicitacao = Solicitacao.find(params[:id])
  end

  def solicitacao_params
    params.require(:solicitacao).permit(:imovel_id, :data_interesse, :preco_proposto, :mensagem)
  end
end