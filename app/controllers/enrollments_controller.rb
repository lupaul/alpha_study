class EnrollmentsController < ApplicationController

  def index
    @enrollments = Enrollment.all
  end
  def new
    @enrollment = Enrollment.new
  end

  def create
    @enrollment = Enrollment.new(enrollment_params)
    if @enrollment.save
      flash[:notice] = "Successfully to send our message..."
      redirect_to root_path
    else
      render :new
    end
  end

  def be_partner
    @enrollment = Enrollment.find(params[:id])
    generated_password = Devise.friendly_token.first(8)
    newuser = User.create!(name: @enrollment.name, email: @enrollment.email, password: generated_password)
    if newuser.present?
      user = newuser.build_school(name: @enrollment.school)
      user.save
      flash[:notice] = "Successfully created user"
      redirect_to enrollments_path
    else
      redirect_to :back
      flash[:alert] = "Didn't add user"
    end

  end

  private

  def enrollment_params
    params.require(:enrollment).permit(:name, :email, :school, :comment, :cooperation_id)
  end
end
