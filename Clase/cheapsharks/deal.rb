require "rest-client"
require_relative "store"

class Deal

	attr_reader :deal

	def initialize(gameID)
		deal = RestClient.get "http://www.cheapshark.com/api/1.0/games?id=" + gameID
		@deal = JSON.parse(deal)
		@index = Array.new
	end

	def stores_and_deals
		stores = Store.new
		comparing = 0
		puts "hay #{@deal["deals"].size} ofertas disponibles"
		puts 
		@deal["deals"].each_with_index do |stors, index|
			@index[index]=stors["storeID"]
			end
		@index.each do ||	
				stores.get_stores.each do |store|
				if store["storeID"] == @index[comparing]
				puts "Store: #{store["storeName"]}"
				comparing +=1
				end
			end
		end
	end
end
