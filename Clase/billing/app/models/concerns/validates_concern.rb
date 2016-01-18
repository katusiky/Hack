module ValidatesConcern
	extend ActiveSupport::Concern

	NUMBERS = /\d+/

	def only_numbers
		self.class.attribute_names.each do |attr|
			if self.attr.class == Integer || self.attr.class == Float 
				validates attr, numericality: true,
												format: NUMBERS
			end
	end

	def set_all_to_upcase
		self.class.attribute_names.each do |attribute|
			self.send(attribute).upcase! if self.send(attribute).class == String
			end
		end
	end
end