require "rest-client"
require_relative "articulo"

class Digg

	def initialize

		articulos_digg = RestClient.get "http://digg.com/api/news/popular.json"
		articulos_digg = JSON.parse(articulos_digg)
		articulos_digg = articulos_digg["data"]["feed"]
	
		articulos_digg.length.times do |elem|
			titulo = articulos_digg[elem]["content"]["title_alt"]
			autor = articulos_digg[elem]["content"]["author"]
			fecha = Time.at(articulos_digg[elem]["date"])
			Articulo.publicaciones(fecha, autor, titulo)
		end
	end
end
