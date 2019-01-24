class AddAppointmentTimeToCandidates < ActiveRecord::Migration[5.0]
  def change
    add_column :candidates, :appointment_time, :string
  end
end
