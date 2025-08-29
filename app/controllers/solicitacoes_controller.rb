class SolicitacoesController < ApplicationController
  before_action :authenticate_cliente!, only: [:index, :new, :create, :edit, :update]
  before_action :authenticate_corretor!, only: [:em_andamento, :aceitar, :rejeitar, :concluir]

  load_and_authorize_resource except: [:index, :minhas_solicitacoes, :em_andamento]

  # Cliente: criar nova solicitação
  def new
    @solicitacao = current_cliente.solicitacoes.build(imovel_id: params[:imovel_id])
  end

  def create
    @solicitacao = current_cliente.solicitacoes.build(solicitacao_params)
    @solicitacao.status = "Em Aberto"
    authorize! :create, @solicitacao

    if @solicitacao.save
      redirect_to imoveis_path, notice: "Solicitação criada com sucesso!"
    else
      render :new
    end
  end

  # Cliente: editar solicitação
  def edit
    authorize! :update, @solicitacao
  end

  def update
    authorize! :update, @solicitacao
    if @solicitacao.update(solicitacao_params)
      redirect_to minhas_solicitacoes_path, notice: "Solicitação atualizada com sucesso!"
    else
      render :edit
    end
  end

  # Cliente: listar suas solicitações
  def minhas_solicitacoes
    @solicitacoes = current_cliente.solicitacoes.includes(:imovel)
    authorize! :read, Solicitacao
  end

  # Corretor: solicitações em andamento
  def em_andamento
    @solicitacoes = Solicitacao.joins(:imovel)
                               .where(imoveis: { corretor_id: current_corretor.id })
                               .includes(:cliente, :imovel)
    authorize! :read, Solicitacao
  end

  # Corretor: aceitar, rejeitar, concluir
  def aceitar
    authorize! :update, @solicitacao
    @solicitacao.update(status: "Aceita")
    redirect_to solicitacoes_em_andamento_path, notice: "Solicitação aceita."
  end

  def rejeitar
    authorize! :update, @solicitacao
    @solicitacao.update(status: "Rejeitada")
    redirect_to solicitacoes_em_andamento_path, notice: "Solicitação rejeitada."
  end

  def concluir
    @solicitacao = Solicitacao.find(params[:id])
    authorize! :update, @solicitacao

    ActiveRecord::Base.transaction do
      # 1. Atualizar status da solicitação
      @solicitacao.update!(status: "Concluída")

      # 2. Atualizar status do imóvel
      imovel = @solicitacao.imovel
      imovel.update!(status: "vendido")

      # 3. Criar a venda
      Venda.create!(
        cliente: @solicitacao.cliente,
        corretor: imovel.corretor,
        imovel: imovel,
        valor: @solicitacao.preco_proposto,
        data: Date.today
      )
    end

    redirect_to solicitacoes_em_andamento_path, notice: "Venda concluída com sucesso!"
  rescue => e
    redirect_to solicitacoes_em_andamento_path, alert: "Erro ao concluir venda: #{e.message}"
  end


  # Cliente e corretor: deletar
  # def destroy_cliente
  #   @solicitacao = current_cliente.solicitacoes.find(params[:id])
  #   authorize! :destroy, @solicitacao
  #   if ["Rejeitada", "Concluída"].include?(@solicitacao.status)
  #     @solicitacao.destroy
  #     redirect_to minhas_solicitacoes_path, notice: "Solicitação excluída."
  #   else
  #     redirect_back fallback_location: root_path, alert: "Só é possível excluir solicitações rejeitadas ou concluídas."
  #   end
  # end

  # def destroy_corretor
  #   @solicitacao = Solicitacao.find(params[:id])
  #   authorize! :destroy, @solicitacao
  #   if ["Rejeitada", "Concluída"].include?(@solicitacao.status)
  #     @solicitacao.destroy
  #     redirect_to solicitacoes_em_andamento_path, notice: "Solicitação excluída."
  #   else
  #     redirect_back fallback_location: root_path, alert: "Só é possível excluir solicitações rejeitadas ou concluídas."
  #   end
  # end

  def destroy
    if cliente_signed_in? && @solicitacao.cliente == current_cliente
      authorize! :destroy, @solicitacao
      @solicitacao.destroy
      redirect_to minhas_solicitacoes_path, notice: "Solicitação excluída."
    elsif corretor_signed_in? && @solicitacao.imovel.corretor == current_corretor
      authorize! :destroy, @solicitacao
      @solicitacao.destroy
      redirect_to solicitacoes_em_andamento_path, notice: "Solicitação excluída."
    else
      redirect_back fallback_location: root_path, alert: "Não autorizado."
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
