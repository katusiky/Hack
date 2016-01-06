class Movie 

	attr_accessor :title, :year, :type, :imdb_id, :genre, :rated

	def initialize (movie)

		@title = movie["Title"]
		@year = movie["Year"]
		@type = movie["Type"]
		@genre = movie["Genre"]
		@rated = movie["Rated"]
		@imdb_id = movie["imdbID"]
	end
end