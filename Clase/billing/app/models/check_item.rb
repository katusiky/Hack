class CheckItem < ActiveRecord::Base
  belongs_to :check
  belongs_to :item
  
  NUMBERS = /\d+/

	validates :item_id, numericality: true, format: NUMBERS
	validates :check_id, numericality: true, format: NUMBERS
	validates :quantity, numericality: true, format: NUMBERS

	before_save :set_all_to_upcase
	before_save :sum_all
	before_save :set_total_amount

	private
	def set_all_to_upcase
		self.class.attribute_names.each do |attribute|
			self.send(attribute).upcase! if self.send(attribute).class == String
		end
	end

	def sum_all
		self.sub_total = Item.find(item_id).price * self.quantity
		self.total_tax = Item.find(item_id).tax * self.quantity
	end

	def set_total_amount
		self.check.total_amount = self.check.total_amount + self.sub_total + self.total_tax
		self.check.save
	end
end