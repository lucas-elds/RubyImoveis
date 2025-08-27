class SolicitacoesController < ApplicationController
  before_action :authenticate_cliente!, only: [:new, :create]
  before_action :authenticate_corretor!, only: [:index, :aceitar]
  before_action :set_solicitacao, only: [:show, :aceitar]

  def index
    if current_corretor
      @solicitacoes = Solicitacao.joins(:imovel)
                                 .where(imoveis: {corretor_id: current_corretor.id})
    elsif current_cliente
      @solicitacoes = current_cliente.solicitacoes
    end
  end

  def show
  end

  def new
    @solicitacao = current_cliente.solicitacoes.build
    @solicitacao.imovel_id = params[:imovel_id] if params[:imovel_id]
  end

  def create
    @solicitacao = current_cliente.solicitacoes.build(solicitacao_params)
    if @solicitacao.save
      redirect_to @solicitacao, notice: "Solicitação criada com sucesso."
    else
      render :new
    end
  end

  def aceitar
    @solicitacao.update(status: "Aceita")
    redirect_to solicitacoes_path, notice: "Solicitação aceita com sucesso."
  end

  private

  def set_solicitacao
    @solicitacao = Solicitacao.find(params[:id])
  end

  def solicitacao_params
    params.require(:solicitacao).permit(:imovel_id, :data_interesse, :preco_proposto, :mensagem, :status)
  end
end
