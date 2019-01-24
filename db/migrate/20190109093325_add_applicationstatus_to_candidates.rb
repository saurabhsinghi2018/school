class AddApplicationstatusToCandidates < ActiveRecord::Migration[5.0]
  def change
    add_column :candidates, :applicationstatus, :string
  end
end
