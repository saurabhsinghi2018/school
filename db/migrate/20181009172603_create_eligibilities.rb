class CreateEligibilities < ActiveRecord::Migration[5.0]
  def change
    create_table :eligibilities do |t|
      t.string :section
      t.string :dateofbirthtill
      t.string :age
      t.string :dateason

      t.timestamps
    end
  end
end
