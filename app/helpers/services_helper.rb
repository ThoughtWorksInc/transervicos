module ServicesHelper
  def save_service_text(service)
    service.persisted? ? 'Salvar alterações' : 'Cadastrar serviço'
  end

  def states_selector
    State.all.order(:name)
  end

  def should_display_owner_data(service)
    service.try(:owner_name).present?
  end

  def get_selected_subarea_id(service)
    service.subarea && service.subarea.area ? service.subarea.area.id : nil
  end

  def get_selected_subareas(service)
    service.subarea && service.subarea.area ? service.subarea.area.subareas : []
  end
end
