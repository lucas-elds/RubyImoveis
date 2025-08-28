class ImoveisController < ApplicationController
  before_action :authenticate_corretor!, except: [:index, :show]
  before_action :set_imovel, only: [:show, :edit, :update, :destroy]
  before_action :authorize_corretor!, only: [:edit, :update, :destroy]

  # GET /imovels or /imovels.json
  def index
    if cliente_signed_in?
      # Exclui imóveis já solicitados pelo cliente
      solicitados_ids = current_cliente.solicitacoes.pluck(:imovel_id)
      @imoveis = Imovel.where(status: "disponível").where.not(id: solicitados_ids)
    else
      @imoveis = Imovel.where(status: "disponível")
    end
  end

  def captacoes
    @captacoes = current_corretor.imoveis
  end

  # GET /imovels/1 or /imovels/1.json
  def show
  end

  # GET /imovels/new
  def new
    @imovel = Imovel.new
  end

  # GET /imovels/1/edit
  def edit
  end

  # POST /imovels or /imovels.json
  def create
    @imovel = current_corretor.imoveis.build(imovel_params)

    respond_to do |format|
      if @imovel.save
        format.html { redirect_to meus_imoveis_path, notice: "Imóvel criado com sucesso." }
        format.json { render :show, status: :created, location: @imovel }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @imovel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /imovels/1 or /imovels/1.json
  def update
    respond_to do |format|
      if @imovel.update(imovel_params)
        format.html { redirect_to meus_imoveis_path, notice: "Imóvel atualizado com sucesso.", status: :see_other }
        format.json { render :show, status: :ok, location: @imovel }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @imovel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /imovels/1 or /imovels/1.json
  def destroy
    @imovel.destroy!

    respond_to do |format|
      format.html { redirect_to meus_imoveis_path, notice: "Imóvel excluído com sucesso.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_imovel
      @imovel = Imovel.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def imovel_params
      params.expect(imovel: [ :preco, :tamanho, :n_quartos, :n_banheiros, :rua, :numero, :cidade, :bairro, :uf, :tipo])
    end

    def authorize_corretor!
      unless @imovel.corretor == current_corretor
        redirect_to imoveis_path, alert: "Você não tem permissão para alterar este imóvel."
      end
    end
end
