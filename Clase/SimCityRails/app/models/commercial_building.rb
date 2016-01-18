class CommercialBuilding < ActiveRecord::Base
  belongs_to :city
 
  has_many :complex_materials
end
