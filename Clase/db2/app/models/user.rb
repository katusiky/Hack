class User < ActiveRecord::Base
	has_one :account

	PASSWORD_REGEX = /[A-Z](\w)*(\d){3}[A-Z](\+\,\%)*/

	validates :login, presence: true,
										uniqueness: true,
										length: { :in => 6..20}
	validates :password, presence: true,
										length: { :in => 8..15}
										
	validates :email, presence: true,
										uniqueness: true
	before_save :set_all_to_upcase

	private

	def set_all_to_upcase
		self.class.attribute_names.each do |attribute|
			self.send(attribute).upcase! if self.send(attribute).class == String
		end
	end
end
