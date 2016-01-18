class BasicMaterial < ActiveRecord::Base
	has_many :factory_basic_materials
	has_many :factories, through: :factory_basic_materials
	
	has_many :material_relations
	has_many :complex_materials, through: :material_realtions
end
