class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.float :price, null: false, default: 0
      t.float :tax, null: false, default: 0

      t.timestamps null: false
    end
  end
end
