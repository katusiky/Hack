class MaterialRelation < ActiveRecord::Base
  belongs_to :complex_material
  belongs_to :basic_material
end
