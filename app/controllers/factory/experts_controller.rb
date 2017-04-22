class Factory::ExpertsController < ApplicationController
  before_action :expert_find, except: [ :index, :new, :create ]

  def index
    @experts = Expert.all
  end

  def new
    @expert = Expert.new
  end

  def create
    expert = Expert.new(expert_params)
    expert.save! ? redirect_to(experts_path) : render(:new)
  end

  def show
  end

  def edit
  end

  def update
    @expert.update!(expert_params) ? redirect_to(expert_path) : render(:edit)
  end

  def destroy
    @expert.destroy
    redirect_to experts_path
  end

  private

    def expert_params
      params.require(:expert).permit(:name, :subject, :video_url, :article)
    end

    def expert_find
      @expert = Expert.find(params[:id])
    end
end