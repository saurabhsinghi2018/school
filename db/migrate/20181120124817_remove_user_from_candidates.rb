class RemoveUserFromCandidates < ActiveRecord::Migration[5.0]
  def change
    remove_reference :candidates, :user, foreign_key: true
  end
end
