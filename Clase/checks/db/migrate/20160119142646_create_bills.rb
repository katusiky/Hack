class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.integer :bill_num, null: false, default: 0, limit: 8
      t.string :name, null: false
      t.string :telephone_number, null: false
      t.string :identity, null: false
      t.float :item, null: false, default: 0
      t.integer :quantity, null: false, default: 0, limit: 8
      t.float :sub_total, null: false, default: 0
      t.float :total_tax, null: false, default: 0
      t.float :total_amount, null: false, default: 0

      t.timestamps null: false
    end
  end
end
