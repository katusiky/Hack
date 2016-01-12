class AddColumnPointsToHistories < ActiveRecord::Migration
  def change
    add_column :histories, :points, :integer 
  end
end
