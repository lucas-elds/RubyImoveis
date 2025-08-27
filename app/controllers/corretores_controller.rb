class CorretoresController < ApplicationController
  before_action :set_corretor, only: %i[ show edit update destroy ]

  # GET /corretors or /corretors.json
  def index
    @corretores = Corretor.all
  end

  # GET /corretors/1 or /corretors/1.json
  def show
  end

  # GET /corretors/new
  def new
    @corretor = Corretor.new
  end

  # GET /corretors/1/edit
  def edit
  end

  # POST /corretors or /corretors.json
  def create
    @corretor = Corretor.new(corretor_params)

    respond_to do |format|
      if @corretor.save
        format.html { redirect_to @corretor, notice: "Corretor was successfully created." }
        format.json { render :show, status: :created, location: @corretor }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @corretor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /corretors/1 or /corretors/1.json
  def update
    respond_to do |format|
      if @corretor.update(corretor_params)
        format.html { redirect_to @corretor, notice: "Corretor was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @corretor }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @corretor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /corretors/1 or /corretors/1.json
  def destroy
    @corretor.destroy!

    respond_to do |format|
      format.html { redirect_to corretores_path, notice: "Corretor was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_corretor
      @corretor = Corretor.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def corretor_params
      params.expect(corretor: [ :creci, :nome, :cpf, :endereco, :telefone ])
    end
end
