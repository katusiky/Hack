require "rest-client"
require 'net/http'
TOKEN_PAIR=['T1VHRJWSE9MTWBWF', 'CXA7HNKB01HN4MP7']

class Service
	attr_accessor :response

	def initialize
		obtain = RestClient.get "https://T1VHRJWSE9MTWBWF:CXA7HNKB01HN4MP7@api.handwriting.io/handwritings"
		@response = JSON.parse(obtain)
	end

	def render letter_name, objects, type 
		url = "https://api.handwriting.io/render/#{type}"
		uri = URI(url)
		uri.query = URI.encode_www_form(objects)
		requ = Net::HTTP::Get.new(uri)
		requ.basic_auth(TOKEN_PAIR[0], TOKEN_PAIR[1])
		res = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) {|http|
		  http.request(requ)
		}
		Dir.mkdir("letters") unless File.exists?("letters")
		dir = "letters/"
		dir += letter_name
		open(dir, 'wb') do |letter|
		  letter.write(res.body)
		end
	end
end



