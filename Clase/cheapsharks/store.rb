require "rest-client"
class Store 

	attr_accessor :get_stores

	def initialize
		get_stores = RestClient.get "http://www.cheapshark.com/api/1.0/stores"
		@get_stores = JSON.parse(get_stores)
	end
end
