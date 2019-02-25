class AddReceiptToCandidates < ActiveRecord::Migration[5.0]
  def change
    add_column :candidates, :receipt, :string
  end
end
