class CreateCommercialBuildings < ActiveRecord::Migration
  def change
    create_table :commercial_buildings do |t|
      t.references :city, index: true, foreign_key: true
      t.string :name, null: false
      t.integer :required_level, null: false, default: 0
      t.integer :capacity, null: false, default: 10
      t.integer :position_X
      t.integer :position_y

      t.timestamps null: false
    end
  end
end
