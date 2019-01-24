class AddReasonToCandidates < ActiveRecord::Migration[5.0]
  def change
    add_column :candidates, :reason, :string
  end
end
