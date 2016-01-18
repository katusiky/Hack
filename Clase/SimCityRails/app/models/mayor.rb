class Mayor < ActiveRecord::Base
	has_one :city
	
	validates_presence_of :name, :ref_number
end
