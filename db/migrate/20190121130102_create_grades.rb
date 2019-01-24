class CreateGrades < ActiveRecord::Migration[5.0]
  def change
    create_table :grades do |t|
      t.references :section, foreign_key: true
      t.string :grade

      t.timestamps
    end
  end
end
