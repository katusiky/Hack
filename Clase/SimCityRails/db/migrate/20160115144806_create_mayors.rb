class CreateMayors < ActiveRecord::Migration
  def change
    create_table :mayors do |t|
      t.string :name, null: false
      t.string :last_name, null: false
      t.integer :ref_number

      t.timestamps null: false
    end
  end
end
