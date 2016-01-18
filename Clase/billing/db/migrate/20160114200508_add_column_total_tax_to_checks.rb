class AddColumnTotalTaxToChecks < ActiveRecord::Migration
  def change
  	add_column :check_items, :total_tax, :float, null: false, default: 0
  end
end
