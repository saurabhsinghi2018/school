class AddAppointmentDateToCandidates < ActiveRecord::Migration[5.0]
  def change
    add_column :candidates, :appointment_date, :string
  end
end
