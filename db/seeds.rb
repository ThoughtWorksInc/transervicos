areas  = ["saude", "direito", "educacao", "religiao", "comidas", "beleza"]
subareas_array = [
				["Odontologia",  "Cirurgia Plástica ",  "Urologia ",  "Ginecologia ",  "Endocrinologia ",  "Dermatologia ",  "Cirurgia Geral ",  "Infectologia ",  "Proctologia "],
		 		["Advocacia"],
		 		["Preparatório Pré-Vestibular", "Ensino Médio", "Ensino Fundamental", "Ensino Superior"]
				]

areas.each do |name|
	Area.create(area: name)
end 

subareas_array.each_with_index do |subareas, index|
	subareas.each do |name| 
		Subarea.create(subarea: name, area_id: index + 1)
	end
end