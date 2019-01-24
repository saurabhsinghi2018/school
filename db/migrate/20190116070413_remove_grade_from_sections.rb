class RemoveGradeFromSections < ActiveRecord::Migration[5.0]
  def change
    remove_column :sections, :grade, :string
  end
end
