class AddGradeToSections < ActiveRecord::Migration[5.0]
  def change
    add_column :sections, :grade, :string
  end
end
