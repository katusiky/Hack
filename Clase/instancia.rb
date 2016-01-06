class Person 

	attr_accessor :name, :last
	
	@@last = "hola"

	def initialize
		@name = "jhon"
	end

	def set_testing last
		@@last = last
	end

	def get_testing
		@@last 
	end
end



jose = Person.new
brian = Person.new


jose.name = "jose"
brian.name = "brian"



puts "#{jose.get_testing} yo soy #{jose.name}"
brian.set_testing "probando"
puts "yo estoy probando #{brian.get_testing}"
