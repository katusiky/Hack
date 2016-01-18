class Item < ActiveRecord::Base
	has_many :check_items
	has_many :checks, through: :check_items
	
	NUMBERS = /\d+/

	validates :price, numericality: true, format: NUMBERS
	validates :tax, numericality: true, format: NUMBERS

	after_create :set_tax
	before_save :set_all_to_upcase

	private
	def set_all_to_upcase
		self.class.attribute_names.each do |attribute|
			self.send(attribute).upcase! if self.send(attribute).class == String
		end
	end

	def set_tax
		self.tax = (self.price * 12) / 100 
		self.save
	end
end
