class AddChampionRefToHistories < ActiveRecord::Migration
  def change
    add_reference :histories, :champion, index: true, foreign_key: true, null: :false
  end
end
