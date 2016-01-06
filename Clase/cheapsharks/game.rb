class Game

	attr_reader :game_id, :cheapest, :name

	def initialize(title)
		@game_id = title["gameID"]
		@cheapest = title["cheapest"]
		@name = title["external"]
	end
end