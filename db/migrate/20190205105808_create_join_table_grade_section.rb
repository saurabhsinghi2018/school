class CreateJoinTableGradeSection < ActiveRecord::Migration[5.0]
  def change
    create_join_table :grades, :sections do |t|
     t.index [:grade_id, :section_id]
     t.index [:section_id, :grade_id]
   end
  end
end
