class AddColumnStateToAnyshits < ActiveRecord::Migration
  def change
    add_column :anyshits, :blah, :integer, null: false
    add_column :anyshits, :is_even_blah, :boolean
  end
end
