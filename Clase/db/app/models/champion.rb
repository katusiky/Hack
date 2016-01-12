class Champion < ActiveRecord::Base
	has_many :histories
	has_many :players, through: :histories
end
