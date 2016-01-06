require "rest-client"
require "json"

class Mashable

	def initialize

		articulos_mashable = RestClient.get "http://mashable.com/stories.json"
		articulos_mashable = JSON.parse(articulos_mashable)
		articulos_mashable = articulos_mashable["new"]
	
		articulos_mashable.length.times do |elem|
			titulo = articulos_mashable[elem]["title"]
			autor = articulos_mashable[elem]["author"]
			epoch = Time.parse(articulos_mashable[elem]["post_date"]).to_i
			fecha = Time.at(epoch)
		end
	end

end
