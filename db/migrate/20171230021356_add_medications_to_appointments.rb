class AddMedicationsToAppointments < ActiveRecord::Migration[5.1]
  def change
    add_column :appointments, :medications, :string
  end
end
