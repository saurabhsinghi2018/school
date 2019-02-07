class DropgradesTable < ActiveRecord::Migration[5.0]
  def change
    drop_table :grades
  end
end
