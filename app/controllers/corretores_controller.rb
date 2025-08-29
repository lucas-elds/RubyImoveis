class CorretoresController < ApplicationController
  before_action :authenticate_corretor!

  # GET /corretores/perfil
  def perfil
    @corretor = current_corretor
    authorize! :read, @corretor
  end

  # GET /corretores/edit
  def edit
    @corretor = current_corretor
    authorize! :update, @corretor
  end

  # PATCH/PUT /corretores
  def update
    @corretor = current_corretor
    authorize! :update, @corretor

    if @corretor.update_without_password(corretor_params)
      redirect_to imoveis_path, notice: "Perfil atualizado com sucesso."
    else
      render :edit
    end
  end

  # DELETE /corretores
  def destroy
    @corretor = current_corretor
    authorize! :destroy, @corretor

    @corretor.destroy
    redirect_to root_path, notice: "Conta excluída com sucesso."
  end

  private

  def corretor_params
    params.require(:corretor).permit(
      :creci,
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
