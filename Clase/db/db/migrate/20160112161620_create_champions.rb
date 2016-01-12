class CreateChampions < ActiveRecord::Migration
  def change
    create_table :champions do |t|
      t.string :name, null: false
      t.string :roll, null: false

      t.timestamps null: false
    end
  end
end
