require "rest-client"

class Service 

	def callService(arguments)
		JSON.parse(RestClient.get link, params: arguments)
	end
end

private 

	def link
		"http://www.omdbapi.com"
	end
end