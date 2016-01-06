require "rest-client"

class Peliculas

	def initialize (nombreP= "frozen")
		@peliculas = Hash.new
		@age = Array.new
		pelicula = RestClient.get("http://www.omdbapi.com/?s=#{nombreP}")
		pelicula = JSON.parse(pelicula)
		pelicula = pelicula["Search"]

		pelicula.length.times do |elem|
			title = pelicula[elem]["Title"]
			age = pelicula[elem]["Year"]
			id = pelicula[elem]["imdbID"]
			publicaciones(title, age, id)
		end
	end


	def publicaciones title, age, id
		@peliculas[age]= {title => id}
		@age.push(age)
	end


	def ver_publicado
		ordenando
		@peliculas.each do |age, title, id|
			puts "Año = " + age
			puts "Pelicula = " + title
			puts "IMDB_ID = " + id
		end
	end

	def peliculas
		@peliculas
	end

	protected

	def ordenando 
		ordenado = Hash.new
		@age.sort!.reverse!.each do |elem|
			 ordenado[elem]= @peliculas[elem]
		end
		@peliculas = ordenado
	end
end

frozen = Peliculas.new
frozen.ver_publicado