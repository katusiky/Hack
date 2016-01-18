class Client < ActiveRecord::Base
	has_many :checks
		
	before_save :set_all_to_upcase
	
	private
	def set_all_to_upcase
		self.class.attribute_names.each do |attribute|
			self.send(attribute).upcase! if self.send(attribute).class == String
		end
	end
end
