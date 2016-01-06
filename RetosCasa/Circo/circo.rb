require_relative "tent"
require_relative "clown"
require_relative "animals"

class Circo

	attr_accessor :name, :price, :clowns, :clown, :animals, :tent, :ganancias, :contadorPer

	def initialize (name)
		@name = name
		@clowns = Array.new
		@ganancias = 0
		@contadorPer = 0 
	end

	def set_capacity (capA, capC, capS)
		@tent = Tent.new(capA, capC, capS)
		puts "------------------------------------------------------"
		puts "Este circo consta con una carpa que tiene capacidad para #{capA} animales, #{capC} payasos y #{capS} espectadores."
	end

	def add_clown (name, last, nose, shoes, nickname)
		@clown = Clown.new(name, last, nose, shoes, nickname)
		@clowns.push(@clown)
		puts "-------------------------------------------"
		puts "Mi nombre es #{name} y me dicen #{nickname}"
		puts
	end

	def animals_cuantity (lion, elephant, monkey, dog)
		@animals = Animals.new(lion, elephant, monkey, dog)
		puts "Hay #{lion} leon, #{elephant} elefante, #{monkey} monos y #{dog} perros"
		puts
	end

	def set_ticket (price)
		@price = price
		puts "El boleto de entrada del circo tiene un precio de #{@price}$"
		puts
	end

	def sell_ticket (quantity)
		
		if @price == nil
			puts "no se ha establecido el precio del ticket"
			return
		end
		
		if @tent == nil
			puts "cual es la capacidad de la carpa?"
			return
		end
		
		if @contadorPer < @tent.capSpectators
		@ganancias = @ganancias + (@price * quantity)
		@contadorPer += quantity
		puts "Se han vendido #{quantity} boletos"
		puts
		puts "se ha obtenido una ganancia de #{ganancias}$ por #{contadorPer} boletos vendidos"
		puts
		puts "------------------------------------------------------"
		else 
			puts "Ya no hay entradas"
		end
	end

end

jose = Circo.new("Josentino")
puts
puts "Bienvenidos al nuevo circo de #{jose.name}"
puts "QUE BARAAATOOO!! QUE BARAAATOOO!!!"
puts
jose.set_capacity(7, 10, 35)
puts 
jose.add_clown("Laura", "Gineth", "Gorda", "Largos", "Donkeydon")
jose.add_clown("Brian", "Del Alcazar", "Cuadrada", "Pulluos", "Konkyn")
jose.add_clown("Jose", "De Leon", "Afilada", "Puntiagudos", "Katusiky")
puts "------------------------------------------------------"
puts "el circo tiene en total #{jose.clowns.length} payasos"
puts
puts "------------------------------------------------------"
jose.animals_cuantity(1, 1, 3, 2)
puts "------------------------------------------------------"
jose.set_ticket(15	 )
puts "------------------------------------------------------"
jose.sell_ticket(26)
puts
puts "El acto esta por comenzar"
puts 
puts "'Donkeydon', 'Konkyn' y 'Katusiky' se pasan pelotas encendidas en llamas entre ellos sin quemarse ninguno"
puts 
puts "A un costado se pueden observar dos perros parados en dos patas imitando a un humano comun"
puts 
puts "Ahora viene el leon que esta saltando a traves de un aro prendido en fuego como si fuera un gatico"
puts 
puts "Por ultimo han salido los 3 monos montados encima del elefante haciendo malabares sin caerse a pesar de la caminata del gran elefante"
puts
puts "------------------------------------------------------"
puts
puts "	ESTO HA SIDO TODO POR HOY."
puts "  GRACIAS POR VISITARNOS. VUELVA PRONTO."
puts
puts "------------------------------------------------------"