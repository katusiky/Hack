class ComplexObject
=begin
	def initialize (tool="hand", material= "", material2= "")
		@tool = tool
		@material = material
		@material2 = material2
	end
=end
	def self.build (tool="hand", material= "water", material2= "soil")
		if material == "rock" || material == "rubber"
			return "wheel"
		elsif material == "brass" || material == "iron"
			return "chassis"
		elsif material == "clay" || material == "sand"
			return "brick"
		elsif material == "plastic"
			return "tube"
		elsif material == "wheel" && material2 == "chassis"
			return "car"
		elsif material == "brick" && material2 == "tube"
			return "building"
		elsif material == "car" && material2 == "building"
			return "city"
		end
	end
end