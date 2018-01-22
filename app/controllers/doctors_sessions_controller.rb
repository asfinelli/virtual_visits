class DoctorsSessionsController < ApplicationController
  before_action :require_doctor_logged_in, only: [:index]

  def index

  end

  def show
    redirect_to new_doctors_session_path
    # @appointments = Appointment.all
  end

  def new
    @doctor = Doctor.new
  end

  def create
    # byebug
    @doctor = Doctor.find_by(username: params[:doctor][:username]).try(:authenticate, params[:doctor][:password])

    if @doctor
      session[:doctor_id] = @doctor.id
      redirect_to doctors_sessions_path
    else
      flash[:notice] = "Not a valid username.  Please sign up first!"
      redirect_to new_doctor_path
    end
  end

  def destroy
    Doctor.find(session[:doctor_id]).destroy
    session[:doctor_id] = nil
    redirect_to root_path, notice: 'Logged out!'
  end
end
