class CorretoresController < ApplicationController
  before_action :authenticate_corretor!
  before_action :set_corretor, only: %i[ perfil edit update destroy ]

  def perfil
  end

  def edit
  end

  def update
    if @corretor.update_without_password(corretor_params)
      redirect_to imoveis_path, notice: "Perfil atualizado com sucesso."
    else
      render :edit
    end
  end

  def destroy
    @corretor.destroy
    redirect_to root_path, notice: "Conta excluída com sucesso."
  end

  private

  def set_corretor
    @corretor = current_corretor
  end

  def corretor_params
    params.require(:corretor).permit(:creci, :nome, :cpf, :endereco, :telefone, :email, :password, :password_confirmation)
  end
end
