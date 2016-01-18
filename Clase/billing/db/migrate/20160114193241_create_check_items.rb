class CreateCheckItems < ActiveRecord::Migration
  def change
    create_table :check_items do |t|
      t.references :check, index: true, foreign_key: true
      t.references :item, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
