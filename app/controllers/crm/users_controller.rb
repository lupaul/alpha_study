class Crm::UsersController < ApplicationController

  def index
    @users  = User.all

  end

  def new
    if current_user.school.present?
      @school = current_user.school
    else
      @school = current_user.build_school()
    end
  end

  def create
    @school = current_user.build_school(params_school)
    if @school.save
      flash[:notice] = "Success to create "
      redirect_to root_path
    else
      render :new
    end
  end

  def delete
    @user = User.find(params[:id])
    if @user.destroy
      flash[:notice] = "Success to delete account user #{@user.name}"
      redirect_to :back
    else
      flash[:alert] = "Didn't delete user "
      redirect_to :back
    end
  end

  private

  def params_school
    params.require(:school).permit(:name, :description)
  end

end
