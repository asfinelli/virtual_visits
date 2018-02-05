class VirtualVisitsController < ApplicationController
  before_action :require_logged_in
  before_action :require_doctor_logged_in
  def show
    @appointment = Appointment.find(params[:id])

    if not current_appointment.follow_up.blank?
      redirect_to doctors_sessions_path(current_doctor)
    else
      @appointment = current_appointment
    end
  end

  def index
    @appointment = Appointment.find(params[:id])

  end
end
