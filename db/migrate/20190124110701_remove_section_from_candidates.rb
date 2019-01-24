class RemoveSectionFromCandidates < ActiveRecord::Migration[5.0]
  def change
    remove_reference :candidates, :section, foreign_key: true
  end
end
