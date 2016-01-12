class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :username, null: false
      t.string :password, null: false

      t.timestamps null: false
    end
  end
end
