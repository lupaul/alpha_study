class Admin::PagesController < ApplicationController
  layout 'admin', except: :show

  before_action :authenticate_user!

  def index
    @page = current_user.page if current_user.page
  end

  def show  # preview
    @page = current_user.page if current_user.page
    render layout: 'preview'
  end

  def new
    @school = current_user.school
    @page = Page.new
  end

  def create
    page = Page.new(page_params)
    page.school = current_user
    page.save ? redirect_to( action: :index ) : render(:new)
  end

  def edit
    @page = Page.find(params[:id])
  end

  def update
    @page = Page.find(params[:id])
    @page.update(page_params) ? redirect_to( action: :index ) : render(:edit)
  end

  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    redirect_to(:show)
  end

  private
  
    def page_params
      params.require(:page).permit(:slogan, :main_image, 
                                   :first_description, :second_description, :third_description,
                                   :first_image, :second_image, :third_image)
    end

end
