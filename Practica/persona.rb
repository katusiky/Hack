require_relative "direccion"

class Persona

	attr_accessor :name, :apellido, :direcciones

	def initialize(name, last)
		@nombre= name
		@apellido = last
		@direcciones = Array.new
	end

	def agregar_direccion(direccion)
		@direcciones.push(direccion)
	end

	def eliminar_direccion(indice)
		@direcciones.delete_at(indice)
	end

	def buscar_direcciones_habitacion
		@direcciones.select { |e| e.es_fiscal?}
	end

	def buscar_direcciones_por_tipo(tipo, ciudad)
		@direcciones.select do |elem| 
			elem.tipo_direccion == tipo && e.ciudad == ciudad 
		end
	end
	
	def buscar_fiscales
		@direcciones.select {|elem| elem.es_fiscal?}
	end
end

