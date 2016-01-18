class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :name, null: false, default: "NewCity"
      t.integer :population, null: false, default: 0
      t.integer :happiness_percentage, null: false, default: 100
      t.integer :money, null: false, default: 1000
      t.integer :level, null: false, default: 1
      t.references :mayor, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
