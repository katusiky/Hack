class Tent

	attr_accessor :capAnimals, :color, :capClowns, :capSpectators

	def initialize(capAnimals= 30, capClowns= 35, capSpectators= 435, color= "Rojo")
		@capAnimals = capAnimals
		@capClowns = capClowns
		@capSpectators = capSpectators
		@capacityTotal = capAnimals + capClowns + capSpectators
	end

end

