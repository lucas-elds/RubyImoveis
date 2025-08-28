class ClientesController < ApplicationController
  before_action :authenticate_cliente!
  before_action :set_cliente, only: [:perfil, :edit, :update, :destroy]

  # GET /clientes or /clientes.json
  def index
    @clientes = Cliente.all
  end

  def perfil
    # @cliente já é setado pelo before_action
  end

  def update
    if @cliente.update(cliente_params)
      sign_in(@cliente, bypass: true)
      redirect_to imoveis_path, notice: "Perfil atualizado com sucesso."
    else
      render :edit
    end
  end

  # GET /clientes/1 or /clientes/1.json
  def show
  end

  # GET /clientes/new
  def new
    @cliente = Cliente.new
  end

  # GET /clientes/1/edit
  def edit
  end

  def perfil
    @cliente = current_cliente
  end

  # POST /clientes or /clientes.json
  def create
    @cliente = Cliente.new(cliente_params)

    respond_to do |format|
      if @cliente.save
        format.html { redirect_to @cliente, notice: "Cliente was successfully created." }
        format.json { render :show, status: :created, location: @cliente }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cliente.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clientes/1 or /clientes/1.json
  def update
    if @cliente.update_without_password(cliente_params)
      redirect_to imoveis_path, notice: "Perfil atualizado com sucesso."
    else
      render :edit
    end
  end

  # DELETE /clientes/1 or /clientes/1.json
  def destroy
    @cliente.destroy
    redirect_to root_path, notice: "Conta excluída com sucesso."
  end

  private
    def set_cliente
      @cliente = current_cliente
    end

    def cliente_params
      params.require(:cliente).permit(:nome, :cpf, :endereco, :telefone, :email, :password, :password_confirmation)
    end
  end
