class LicensesController < ApplicationController

  def show 
    @license = License.find(params[:id])
    respond_to do |format|
      format.js 
    end
  end

end
