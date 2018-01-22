class AddFollowUpToAppointmentTable < ActiveRecord::Migration[5.1]
  def change
    add_column :appointments, :follow_up, :text
  end
end
