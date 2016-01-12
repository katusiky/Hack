class Player < ActiveRecord::Base
	has_many :histories
	has_many :champions, through: :histories
end
