module ServicesHelper
  def save_service_text(service)
    service.persisted? ? 'Editar serviço' : 'Cadastrar serviço'
  end
end
