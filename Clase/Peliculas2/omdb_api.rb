require "rest-client"
require_relative "movie"

class OmdbApi

	def initialize
		@movies = Array.new
		@my_service = "http://www.omdbapi.com"
	end

	def search_by_title_and_age(title, age)
		json  = JSON.parse(RestClient.get(@my_service, { params: {s: title, y: age}}))
		confirmate(json)
	end

	def search_by_title_and_type(title, type)
		json  = JSON.parse(RestClient.get(@my_service, { params: {s: title, type: type}}))
		confirmate(json)
	end

	def movies
		@movies
	end

	def print_movies
		if movies.length >0 
			movies.each do |mov|
				puts "Titulo= " + mov.title
				puts "Año= " + mov.year
				puts "ID= " + mov.imdb_id
				puts "Tipo= " + mov.type
				puts
			end
		end
	end

	def sorting
		if movies.length != nil
			movies.sort! do |year_min, year_max| 
				year_max.year <=> year_min.year
			end
		end
	end 

	private 

	def confirmate(argument)
		if argument.key?("Error")
			puts argument["Error"]
		else
			argument = argument["Search"]
			argument.each do |mov|
				@movies.push(Movie.new(mov))
			end
		end
	end
end