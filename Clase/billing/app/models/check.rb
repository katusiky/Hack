class Check < ActiveRecord::Base
  belongs_to :client
  has_many :check_items
	has_many :items, through: :check_items
		
	before_save :set_all_to_upcase
	#after_update :total_amount

	private
	def set_all_to_upcase
		self.class.attribute_names.each do |attribute|
			self.send(attribute).upcase! if self.send(attribute).class == String
		end
	end
=begin
	def total_amount
		self.total_amount = CheckItem.find(checkitem_id).sub_total + CheckItem.find(checkitem_id).total_tax
	end
=end
end