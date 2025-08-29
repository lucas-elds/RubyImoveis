class ImoveisController < ApplicationController
  before_action :authenticate_corretor!, except: [:index, :show]
  load_and_authorize_resource except: [:index, :captacoes]  # carregamento automático das ações padrão

  # GET /imoveis
  def index
    if cliente_signed_in?
      solicitados_ids = current_cliente.solicitacoes.pluck(:imovel_id)
      @imoveis = Imovel.where(status: "disponível").where.not(id: solicitados_ids)
    else
      @imoveis = Imovel.where(status: "disponível")
    end
    authorize! :read, Imovel  # garante que CanCanCan autorize a ação
  end

  # GET /corretores/captacoes
  def captacoes
    @captacoes = current_corretor.imoveis
    authorize! :read, Imovel  # <-- aqui você precisa autorizar manualmente
  end

  # GET /imoveis/1
  def show
  end

  # GET /imoveis/new
  def new
    authorize! :create, Imovel
    @imovel = Imovel.new
  end

  # GET /imoveis/1/edit
  def edit
    authorize! :update, @imovel
  end

  # POST /imoveis
  def create
    @imovel = current_corretor.imoveis.build(imovel_params)
    authorize! :create, @imovel

    if @imovel.save
      redirect_to meus_imoveis_path, notice: "Imóvel criado com sucesso."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /imoveis/1
  def update
    authorize! :update, @imovel

    if @imovel.update(imovel_params)
      redirect_to meus_imoveis_path, notice: "Imóvel atualizado com sucesso.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /imoveis/1
  def destroy
    authorize! :destroy, @imovel
    @imovel.destroy
    redirect_to meus_imoveis_path, notice: "Imóvel excluído com sucesso.", status: :see_other
  end

  private

  def imovel_params
    params.require(:imovel).permit(:preco, :tamanho, :n_quartos, :n_banheiros, :rua, :numero, :cidade, :bairro, :uf, :tipo)
  end
end
