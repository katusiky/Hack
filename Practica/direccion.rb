require_relative "tipo_direccion"

class Direccion 

	attr_accessor :calle, :ciudad, :pais, :tipo_direccion

	def initialize(street, city, country)
		@calle = street
		@ciudad = city
		@pais = country
		@tipo_direccion = TipoDireccion.new
	end

	def es_fiscal
		@tipo_direccion.tipo = "Fiscal"
	end

	def es_cobro 
		@tipo_direccion.tipo = "Cobro"
	end

	def es_habitacion
		@tipo_direccion.tipo = "Habitacion"
	end

	def es_fiscal?
		@tipo_direccion.tipo == "Fiscal"
	end

	def es_cobro?
		@tipo_direccion.tipo == "Cobro"
	end

	def es_habitacion?
		@tipo_direccion.tipo =="Habitacion"
	end

end