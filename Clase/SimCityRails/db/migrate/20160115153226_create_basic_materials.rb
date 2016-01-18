class CreateBasicMaterials < ActiveRecord::Migration
  def change
    create_table :basic_materials do |t|
      t.string :name, null: false
      t.string :picture, null: false
      t.integer :require_level, null: false, default: 0

      t.timestamps null: false
    end
  end
end
