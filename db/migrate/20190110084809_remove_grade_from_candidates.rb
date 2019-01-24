class RemoveGradeFromCandidates < ActiveRecord::Migration[5.0]
  def change
    remove_column :candidates, :grade, :string
  end
end
