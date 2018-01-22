class DoctorsController < ApplicationController
  def index
    @doctors = Doctor.all
  end

  def show
  end

  def edit
    @doctor = Doctor.find(params[:id])
  end

  def update
    @doctor = Doctor.find(params[:id])
    if @doctor.update_attributes(doctor_params)
      redirect_to doctors_session_path(@doctor)      # Handle a successful update.
    else
      render 'edit'
    end
  end

  def new
    @doctor = Doctor.new
  end

    def create
      @doctor = Doctor.new(doctor_params)
      if @doctor.save
        redirect_to doctors_sessions_path, notice: 'Created Doctor'
      else
        render :new
      end
    end
    private
        def doctor_params
          params.require(:doctor).permit(:username, :name, :dob, :phone_number, :email, :gender, :address, :city, :state, :postal_code, :country, :password, :password_confirmation)
        end
end
