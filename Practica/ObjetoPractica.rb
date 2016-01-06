class Bolso


	def initialize marca, bolsillos, color 
		@capacidad = [4, 2, 1, 5, 3]
		@bolsillo = Array.new(bolsillos)
		@color = color
		@marca = marca
		@cierre = "cerrado"
	end

	def open bolsi
		@bolsi = @cierre
		if bolsi > @bolsillo.length-1 
			puts "ese bolsillo no existe bro"
			@bolsi 
		else
			@cierre = "abierto"
			puts "has abierto el bolsillo #{bolsi}"
		end
	end

	def capBolsillos 
		@capacidad.each do |lugar|
			puts "el bolsillo #{@capacidad.find_index(lugar)} tiene una capacidad de #{lugar}"
		end
	end

	def guardarEn x, objeto
		if @cierre == "abierto" 
		x.each do |i| 
			x.insert(i, objeto) 
			puts x.to_s 
			end
		else
			puts "el bolsillo esta cerrado!!"
		end
	end
end

myBolso = Bolso.new "quicksilver", 4, "rojo"
myBolso.capBolsillos
puts "---------------------------"
puts "Qué bolsillo quieres abrir?"

myBolso.open(gets.chomp.to_i)
myBolso.guardarEn(gets.chomp.to_i, "llave")
myBolso.guardarEn(gets.chomp.to_i, "cuaderno")
myBolso.guardarEn(gets.chomp.to_i, "libro")