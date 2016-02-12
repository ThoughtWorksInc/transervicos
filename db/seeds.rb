# Areas e Subareas
areas = {
  "Saúde": [
    'Odontologia', 'Cirurgia Plástica', 'Urologia', 'Ginecologia', 'Endocrinologia', 'Dermatologia', 'Cirurgia Geral',
    'Infectologia', 'Proctologia'
  ],
  "Direito": ['Advocacia'],
  "Educação": ['Preparatório Pré-Vestibular', 'Ensino Médio', 'Ensino Fundamental', 'Ensino Superior', 'Idioma'],
  "Religião": [],
  "Comidas": [],
  "Beleza": [],
  "Eventos": [],
  "Moda": ['Costura'],
  "Higiene": ['Limpeza'],
  "Atendimento ao público": [],
  "Alimentação": [],
  "Tecnologia": []
}

areas.each do |area_name, subareas|
  area_exists = Area.find_by(area: area_name)
  next unless !Area.all.exists? || !area_exists
  area = Area.create(area: area_name)
  subareas.each { |subarea_name| Subarea.create(subarea: subarea_name, area_id: area.id) }
  Subarea.create(subarea: 'Outro', area_id: area.id)
end

unless Area.find_by(area: 'Outro')
  area = Area.create(area: 'Outro')
  Subarea.create(subarea: 'Outro', area_id: area.id)
end
