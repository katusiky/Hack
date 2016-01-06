require "rest-client"
require "json"

class Reddit

	@reddit
	@fechas

	def initialize

		fechas = Array.new
		reddit = Hash.new


		articulos_reddit = RestClient.get "https://www.reddit.com/.json"
		articulos_reddit = JSON.parse(articulos_reddit)
		articulos_reddit = articulos_reddit["data"]["children"]
	
		articulos_reddit.length.times do |elem|
			autor = articulos_reddit[elem]["data"]["author"]
			titulo = articulos_reddit[elem]["data"]["title"]
			fecha =  Time.at(articulos_reddit[elem]["data"]["created"])
			fechas.push(fecha)
			puts fecha
			reddit[fecha]= {autor => titulo}
		end
		@reddit = reddit
		@fechas = fechas
	end

	def reddit
		@reddit
	end

	def fechas
		@fechas		
	end
end

jose = Reddit.new