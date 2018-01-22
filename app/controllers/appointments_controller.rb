class AppointmentsController < ApplicationController

  def index
    @appointments = Appointment.all
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.user_id = current_user.id
    if @appointment.save!
      redirect_to virtual_visit_path(@appointment)
    else
      render :new
    end
  end

  def new
    @appointment = Appointment.new(user: current_user)
  end

  def edit
    @appointment = Appointment.find(params[:id])
  end

  def show
    # @appointment = Appointment.new(user: current_user)
    @appointment = Appointment.where(id: params[:id])
  end

  def update
    @appointment = Appointment.find(params[:id])
    appointment_params.merge(doctor: current_doctor)
    # if @appointment.update_attributes(doctor_id: current_doctor.id)
    if @appointment.update(appointment_params)
      redirect_to virtual_visit_path
    else
      render 'edit'
    end
  end

  private

  def appointment_params
    params.require(:appointment).permit(:name, :symptoms, :blood_pressure, :temperature, :timestamp, :medications, :follow_up)
  end
end
