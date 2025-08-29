class ApplicationController < ActionController::Base
  check_authorization unless: :devise_controller?

  before_action :configure_permitted_parameters, if: :devise_controller?

  def current_ability
    @current_ability ||= Ability.new(current_cliente || current_corretor)
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, alert: exception.message
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nome, :cpf, :creci, :telefone])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nome, :cpf, :creci, :telefone])
  end

  # Redirecionamento após login
  def after_sign_in_path_for(resource)
    imoveis_path
  end
end
