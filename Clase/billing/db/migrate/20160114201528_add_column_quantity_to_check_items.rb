class AddColumnQuantityToCheckItems < ActiveRecord::Migration
  def change
    add_column :check_items, :quantity, :integer, null: false
  end
end
