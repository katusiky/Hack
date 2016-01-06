require "rest-client"
require_relative "deal"
require_relative "game"

class Games

	attr_accessor :get_json_game, :all_games, :all_deals

	def initialize (title)
	 get_game = RestClient.get "www.cheapshark.com/api/1.0/games?title=#{title}"
	 @get_json_game = JSON.parse(get_game)
	 @all_deals = Array.new
	 @all_games = Array.new
	 @disponible
	end

	def get_games
		if @get_json_game == []
			@disponible= false
		else
			@get_json_game.each do |game|
				@all_games.push(Game.new(game))
			end
			@disponible = true
		end
	end

	def search_game
		if @disponible
			@all_games.each_with_index do |games, option| 
				puts "--------- #{option+1} ----------"
				puts "#{games.name}"
				puts "Precio: #{games.cheapest}"
				puts "----------------------"
				puts
			end
			puts "Cual desea comprar?"
			selection = gets.chomp.to_i
			if selection <= @all_games.length && selection != 0
				system("clear")
				puts "Para el juego #{@all_games[selection-1].name}"
				@all_games.each_with_index do |gameID, index|
					if index == selection-1
						@all_deals.push(Deal.new(gameID.game_id))
						@all_deals.select do |deals| 
						deals.stores_and_deals
						end
					end
				end
			else
				puts "Opcion incorrecta"
			end
		else
			puts
			puts "El juego no esta disponible en ninguna de nuestras tiendas."
			gets.chomp
		end
	end
end
