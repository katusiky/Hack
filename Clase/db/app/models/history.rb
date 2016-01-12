class History < ActiveRecord::Base
	belongs_to :champion
	belongs_to :player
end
