class ConsultationsController < ApplicationController

  def new
    @consultation = Consultation.new
  end

  def create
    @consultation = Consultation.new(consultation_params)
    if @consultation.save
      flash[:notice] = "預約查詢已建議，學校會儘快回覆給您！"
      redirect_to :root
    else
      flash[:alert] = "Fail!!"
      render :new      
    end
  end

  private

  def consultation_params
    params.require(:consultation).permit(:name, :email, :start_date,
                                        :end_date, datetime: [])
  end
end
