class AddGradeToCandidates < ActiveRecord::Migration[5.0]
  def change
    add_reference :candidates, :grade, foreign_key: true
  end
end
