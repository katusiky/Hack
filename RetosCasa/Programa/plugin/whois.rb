require "rest-client"

class Whois

	attr_reader :whois

	def initialize (ip)
		@whois = RestClient.get "http://api.hackertarget.com/whois/?q=#{ip}"
	end

	def show_whois
		puts @whois
	end
end
