require_relative "monkey"
require_relative "complex_object"
require "date"

class Person < Monkey

	attr_accessor :last_name
	attr_accessor :personal_complex_object_array
	
	@@complex_object_array = Array.new

	def initialize (name, last_name, birthday)
		@name = name
		@last_name = last_name
		@birthday = birthday
		@personal_complex_object_array = Array.new
	end

	def get_name
		@name
	end	

	def set_name
		@name = name
	end

	def full_name
		#[@name, @last_name].join(" ")
		@name + " " + @last_name
	end

	def talk
		reasoning
	end

	def evolving
		evolve
	end

	def person_age
		self.class.age(@birthday)
	end

	def self.age_calculation(birthday)
		age(birthday)
	end

	def building(tool="hand", material="water", material2="soil")
		complex_object_name = ComplexObject.new(tool="hand", material= "water", material2= "soil")
		@@complex_object_array.push(complex_object_name)
		complex_object_name
	end

	def personal_building(tool="hand", material= "water", material2= "soil")
		complex_object_name = ComplexObject.new(tool="hand", material= "water", material2= "soil")
		@@complex_object_array.push(complex_object_name)
		@personal_complex_object_array.push(complex_object_name)
		complex_object_name
	end

	private

	def reasoning
		puts "I´m reasoning!!!!!!"
	end

	def self.age (birthday)
		unless calculator.class == Date
		calculator = Date.parse(birthday)
		end
		present = Time.now
		if (present.month - calculator.month >= 0)
			return present.year - calculator.year
		else
			return (present.year - calculator.year) -1
		end
	end
end