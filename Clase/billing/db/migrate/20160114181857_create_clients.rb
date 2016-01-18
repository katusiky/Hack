class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
    	t.string :name, null: false
    	t.text :address, null: false
    	t.string :telephone_number, null: false
    	t.string :identity, null: false

      t.timestamps null: false
    end
  end
end
