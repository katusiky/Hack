class AddColumnSubTotalToChecks < ActiveRecord::Migration
  def change
  	add_column :check_items, :sub_total, :float, null: false, default: 0 
  end
end
