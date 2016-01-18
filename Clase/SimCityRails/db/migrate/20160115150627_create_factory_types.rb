class CreateFactoryTypes < ActiveRecord::Migration
  def change
    create_table :factory_types do |t|
      t.string :name, null: false
      t.integer :price, null: false, default: 0
      t.integer :required_level, null: false, default: 0
      t.integer :capacity, null: false
      t.integer :dirt_radious_x
      t.integer :dirt_radious_y

      t.timestamps null: false
    end
  end
end
