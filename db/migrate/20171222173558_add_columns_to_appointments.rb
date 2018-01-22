class AddColumnsToAppointments < ActiveRecord::Migration[5.1]
  def change
    add_column :appointments, :name, :string
    add_column :appointments, :symptoms, :string
    add_column :appointments, :blood_pressure, :string
    add_column :appointments, :temperature, :string

  end
end
