class ComplexMaterial < ActiveRecord::Base
  belongs_to :commercial_building
  
  has_many :material_realtions
  has_many :basic_materials, through: :material_realtions
end
