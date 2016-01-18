class City < ActiveRecord::Base
  belongs_to :mayor
 
  has_many :comercial_buildings
  has_many :factories

  validates_presence_of :mayor_id
  after_create :set_default_values

  private
  def set_default_values
		self.name = "New City" if self.name.nil?
  	self.population = 0
  	self.happiness_percentage = 100 
  	self.level = 1
  	self.money = 1000
  	self.save
  end
end
