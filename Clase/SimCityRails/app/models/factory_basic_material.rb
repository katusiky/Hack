class FactoryBasicMaterial < ActiveRecord::Base
  belongs_to :factory
  belongs_to :basic_material

  enum status: [:available, :busy, :ready]
end
