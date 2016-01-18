class Anyshit < ActiveRecord::Base
	after_create :set_false_true
	after_update :set_even

	private
	def set_false_true
		self.isodd = self.id.odd?
		self.save
	end

	def set_even
		self.is_even_blah  = self.blah.even?
	end
end
