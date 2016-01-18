class AddColumnTotalAmountToChecks < ActiveRecord::Migration
  def change
    add_column :checks, :total_amount, :float, null: false, default: 0
  end
end
