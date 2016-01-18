class Factory < ActiveRecord::Base
  belongs_to :city
  belongs_to :factory_type
 
  has_many :factory_basic_materials
  has_many :basic_materials, through: :factory_basic_materials

  validate :adequate_city_level

  private
  def adequate_city_level
  	city_level= City.find(city_id).level
  	if city_level < factory_type.required_level
  		errors.add(:factory_type_id, "you don't have the required level")
  	end
  end
end
