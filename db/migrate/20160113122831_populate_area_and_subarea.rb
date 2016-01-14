class PopulateAreaAndSubarea < ActiveRecord::Migration
  def up
    area_id = 1
    areas.each do |area_name, subareas|
      Area.create(area: area_name)
      subareas.each { |subarea_name| Subarea.create(subarea: subarea_name, area_id: area_id) }
      Subarea.create(subarea: 'Outro', area_id: area_id)
      area_id += 1
    end

    Area.create(area: 'Outro')
    Subarea.create(subarea: 'Outro', area_id: area_id)
  end

  def down
    Area.destroy_all
    Subarea.destroy_all
  end

  def areas
    {
      "Saúde": [
        'Odontologia', 'Cirurgia Plástica', 'Urologia', 'Ginecologia', 'Endocrinologia',
        'Dermatologia', 'Cirurgia Geral', 'Infectologia', 'Proctologia'
      ],
      "Direito": ['Advocacia'],
      "Educação": ['Preparatório Pré-Vestibular', 'Ensino Médio', 'Ensino Fundamental', 'Ensino Superior'],
      "Religião": [],
      "Comidas": [],
      "Beleza": [] }
  end
end
