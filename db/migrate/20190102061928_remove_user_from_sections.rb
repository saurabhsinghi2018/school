class RemoveUserFromSections < ActiveRecord::Migration[5.0]
  def change
    remove_reference :sections, :user, foreign_key: true
  end
end
