# app/models/ability.rb
class Ability
  include CanCan::Ability

  def initialize(user)
    if user.is_a?(Cliente)
      can :meus_imoveis, Venda
      can :read, Venda, cliente_id: user.id
      can :read, Cliente, id: user.id
      can :update, Cliente, id: user.id
      can :destroy, Cliente, id: user.id

      can :read, Imovel
      can :create, Solicitacao
      can [:read, :update, :destroy], Solicitacao, cliente_id: user.id
    elsif user.is_a?(Corretor)
      can :read, Venda, corretor_id: user.id
      can :minhas_vendas, Venda
      can :read, Corretor, id: user.id
      can :update, Corretor, id: user.id
      can :destroy, Corretor, id: user.id

      can :read, Imovel
      can :create, Imovel
      can [:update, :destroy], Imovel, corretor_id: user.id
      can :manage, Solicitacao, imovel: { corretor_id: user.id }
    end
  end
end
