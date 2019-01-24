class AddAppointmentPlaceToCandidates < ActiveRecord::Migration[5.0]
  def change
    add_column :candidates, :appointment_place, :string
  end
end
