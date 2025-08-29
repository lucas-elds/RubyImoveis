class ClientesController < ApplicationController
  before_action :authenticate_cliente!

  # GET /clientes/perfil
  def perfil
    @cliente = current_cliente
    authorize! :read, @cliente
  end

  # GET /clientes/edit
  def edit
    @cliente = current_cliente
    authorize! :update, @cliente
  end

  # PATCH/PUT /clientes
  def update
    @cliente = current_cliente
    authorize! :update, @cliente

    if @cliente.update_without_password(cliente_params)
      redirect_to imoveis_path, notice: "Perfil atualizado com sucesso."
    else
      render :edit
    end
  end

  # DELETE /clientes
  def destroy
    @cliente = current_cliente
    authorize! :destroy, @cliente

    @cliente.destroy
    redirect_to root_path, notice: "Conta excluída com sucesso."
  end

  private

  def cliente_params
    params.require(:cliente).permit(
      :nome,
      :cpf,
      :endereco,
      :telefone,
      :email,
      :password,
      :password_confirmation
    )
  end
end
