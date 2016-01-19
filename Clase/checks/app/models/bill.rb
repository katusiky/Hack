class Bill < ActiveRecord::Base

	NUMBER = /\d+/

	validates :name, :telephone_number, :identity, :item, :quantity, presence: true
	validates :bill_num, :item, :quantity, :sub_total, :total_tax, :total_amount, format: NUMBER
	validates :telephone_number, length: {minimum: 9, maximum: 11}

	before_create :set_bill_num
	before_save :set_all_to_upcase
	after_create :set_sub_total
	after_create :set_total_tax
	after_create :set_total_amount

	scope :lastest, ->{ order("created_at DESC")}

	private

	def set_all_to_upcase
		self.class.attribute_names.each do |attribute|
			self.send(attribute).upcase! if self.send(attribute).class == String
		end
	end

	def set_bill_num
		self.bill_num = self.class.last.bill_num + 0 + 1
	end

	def set_sub_total
		self.sub_total = self.sub_total + (self.item * self.quantity)
		self.save
	end

	def set_total_tax
		self.total_tax = self.sub_total * 0.12
		self.save
	end

	def set_total_amount
		self.total_amount = self.sub_total + self.total_tax
		self.save
	end
end
