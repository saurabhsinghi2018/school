class AddSectionToCandidates < ActiveRecord::Migration[5.0]
  def change
    add_reference :candidates, :section, foreign_key: true
  end
end
