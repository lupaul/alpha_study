class Admin::RootusersController < ApplicationController
  def index
    @photo = Photo.new()
    @photos = Photo.all
  end

  def create
    @photo = Photo.new(photo_params)
    if @photo.save
      flash[:notice] = "Successfully created..."
      redirect_to admin_rootusers_path
    else
      flash[:alert] = "Faild!!!"
    end
  end

  private

  def photo_params
    params.require(:photo).permit(:image)
  end
end
