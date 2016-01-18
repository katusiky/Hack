class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.integer :number, null: false
      t.float :ammount, null: false, default: 0
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
