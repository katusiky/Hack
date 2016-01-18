class CreateFactories < ActiveRecord::Migration
  def change
    create_table :factories do |t|
      t.references :city, index: true, foreign_key: true
      t.references :factory_type, index: true, foreign_key: true
      t.integer :position_x
      t.integer :position_y

      t.timestamps null: false
    end
  end
end
