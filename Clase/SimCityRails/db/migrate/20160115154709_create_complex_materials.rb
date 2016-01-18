class CreateComplexMaterials < ActiveRecord::Migration
  def change
    create_table :complex_materials do |t|
      t.references :commercial_building, index: true, foreign_key: true
      t.string :name, null: false
      t.integer :required_level, null: false, default: 5

      t.timestamps null: false
    end
  end
end
