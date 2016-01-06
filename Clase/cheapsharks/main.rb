require_relative "games"

class Main

	def initialize
		puts "-----------------------"
		puts "        WELCOME"
		puts "-----------------------"
		puts
		puts
		puts "ingresa el nombre del juego"
	end

	def games
		confirmate = true
		while confirmate == true
		game = gets.chomp
			if !game.empty? 
			g = Games.new(game)
			g.get_games
			g.search_game
			confirmate = false
			else
			puts "Ingresa un nombre"
			end 
		end
	end
end


main = Main.new
main.games

