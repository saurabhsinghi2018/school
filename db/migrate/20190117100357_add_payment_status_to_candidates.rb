class AddPaymentStatusToCandidates < ActiveRecord::Migration[5.0]
  def change
    add_column :candidates, :payment_status, :string
  end
end
