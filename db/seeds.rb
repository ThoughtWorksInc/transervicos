areas  = ["Saúde", "Direito", "Educação", "Religião", "Comidas", "Beleza"]
subareas_array = [
				["Odontologia",  "Cirurgia Plástica ",  "Urologia ",  "Ginecologia ",  "Endocrinologia ",  "Dermatologia ",  "Cirurgia Geral ",  "Infectologia ",  "Proctologia "],
		 		["Advocacia"],
		 		["Preparatório Pré-Vestibular", "Ensino Médio", "Ensino Fundamental", "Ensino Superior"]
				]

areas.each { |name| Area.create(area: name) }
Area.create(area: "Outro")

subareas_array.each_with_index do |subareas, index|
	area_id = index + 1
	subareas.each { |name| Subarea.create(subarea: name, area_id: area_id) }
	Subarea.create(subarea: "Outro", area_id: area_id)
end