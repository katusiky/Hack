class Person
	attr_reader :nombre, :apellido

	def initialize name, last
		@nombre = name
		@apellido = last
	end

end

prueba = Person.new "José", "De León"

puts "mi nombre es #{prueba.nombre} y mi apellido #{prueba.apellido}" 