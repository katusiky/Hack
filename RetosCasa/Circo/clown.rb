require_relative "person"

class Clown < Person

	attr_accessor :nose, :shoes, :nickname, :name, :last
 
	def initialize (name,last, nose, shoes, nickname)
		super(name, last)
		@nose = nose
		@shoes = shoes
		@nikcname = nickname
	end
end