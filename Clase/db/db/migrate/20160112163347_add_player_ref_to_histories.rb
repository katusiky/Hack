class AddPlayerRefToHistories < ActiveRecord::Migration
  def change
    add_reference :histories, :player, index: true, foreign_key: true, null: :false
  end
end
