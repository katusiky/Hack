class Persona

	def initialize name
		@name = name
	end

	def caminar 
		"#{@name} caminando"
	end

end

class Heroe < Persona
	attr_reader :power
	def initialize name, power
		super name
		@power = power	
	end
end

hero = Heroe.new "jose", 60
puts "#{hero.caminar}"
puts "#{hero.caminar} tiene de poder #{hero.power}	"