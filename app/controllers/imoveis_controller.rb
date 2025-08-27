class ImoveisController < ApplicationController
  before_action :set_imovel, only: %i[ show edit update destroy ]
  before_action :authenticate_corretor!, only: [:new, :create, :edit, :update, :destroy]

  # GET /imovels or /imovels.json
  def index
    if current_corretor
      @imoveis = current_corretor.imoveis
    else
      @imoveis = Imovel.where(status: "disponível")
    end
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
    @imovel = Imovel.new(imovel_params)

    respond_to do |format|
      if @imovel.save
        format.html { redirect_to @imovel, notice: "Imovel was successfully created." }
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
        format.html { redirect_to @imovel, notice: "Imovel was successfully updated.", status: :see_other }
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
      format.html { redirect_to imoveis_path, notice: "Imovel was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_imovel
      @imovel = Imovel.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def imovel_params
      params.expect(imovel: [ :preco, :tamanho, :n_quartos, :n_banheiros, :rua, :numero, :cidade, :bairro, :uf, :corretor_id ])
    end
end
