class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method  :current_user
  helper_method  :current_doctor

  def current_appointment
    @current_appointment ||= Appointment.find(params[:id])
  end

  def current_doctor
    @current_doctor ||= Doctor.find_by(id: session[:doctor_id])
  end



  def require_doctor_logged_in
    if current_doctor.nil?
      redirect_to root_path
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def require_logged_in
    if current_user.nil?
      redirect_to root_path
    end
  end

end
