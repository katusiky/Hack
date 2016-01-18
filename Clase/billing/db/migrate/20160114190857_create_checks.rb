class CreateChecks < ActiveRecord::Migration
  def change
    create_table :checks do |t|
      t.integer :bill_num, null: false
      t.integer :control_num, null: false
      t.references :client, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
