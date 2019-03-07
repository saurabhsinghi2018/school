class RemoveGradeFromCandidates < ActiveRecord::Migration[5.0]
  def change
    remove_reference :candidates, :grade, foreign_key: true
  end
end
