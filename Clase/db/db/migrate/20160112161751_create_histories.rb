class CreateHistories < ActiveRecord::Migration
  def change
    create_table :histories do |t|
      t.integer :matches, null: false
      t.integer :kills
      t.integer :assists
      t.integer :deads

      t.timestamps null: false
    end
  end
end
