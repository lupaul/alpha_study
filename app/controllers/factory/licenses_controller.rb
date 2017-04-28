class Factory::LicensesController < ApplicationController
  layout 'factory'
  before_action :license_find, except: [ :index, :new, :create ]

  def index
    @licenses = License.all
  end

  def new
    @license = License.new
  end

  def create
    license = License.new(license_params)
    license.save! ? redirect_to(factory_licenses_path) : render(:new)
  end

  def show
  end

  def edit
  end

  def update
    @license.update!(license_params) ? redirect_to(factory_license_path) : render(:edit)
  end

  def destroy
    @license.destroy
    redirect_to factory_licenses_path
  end

  private

    def license_params
      params.require(:license).permit(:title, :description, :category)
    end

    def license_find
      @license = License.find(params[:id])
    end
end
