class Articulo

	@@publicacion = Hash.new
	@@fechas = Array.new

	def self.publicaciones fecha, autor, titulo
		@@publicacion[fecha]= {autor => titulo}
		@@fechas.push(fecha)
	end

	def self.ordenando 
		ordenado = Hash.new
		@@fechas.sort!.each do 
			|elem| ordenado[elem]= @@publicacion [elem]
		end
		@@publicacion = ordenado
	end

	def self.ver_publicado
		Articulo.publicacion.each do |f, a|
			a.each do |b, t|
				puts "Autor = " + b
				puts "Titulo= " + t
				puts
			end
		end
	end

	def self.publicacion
		@@publicacion
	end
end