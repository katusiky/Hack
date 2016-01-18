class CreateFactoryBasicMaterials < ActiveRecord::Migration
  def change
    create_table :factory_basic_materials do |t|
      t.references :factory, index: true, foreign_key: true
      t.references :basic_material, index: true, foreign_key: true
      t.integer :quantity, null: false
      t.integer :status

      t.timestamps null: false
    end
  end
end
