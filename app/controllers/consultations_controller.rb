class ConsultationsController < ApplicationController

  def new
    @consultation = Consultation.new

  end

  def create
    @consultation = current_user.consultations.new(consultation_params)
    if @consultation.save
      flash[:notice] = "預約查詢已建立，學校會儘快回覆給您！"
      redirect_to :root
    else
      flash[:alert] = "Fail!!"
      render :new
    end
  end

  private

  def consultation_params
    params.require(:consultation).permit(:name, :email, :start_date,
                                        :end_date, :school_id,
                                        :license_id, datetime: [])
  end
end
