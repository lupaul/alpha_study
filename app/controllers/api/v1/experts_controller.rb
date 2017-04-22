class Api::V1::ExpertsController < ApiController
  before_action :expert_find, except: [:index, :create]
  
  def index
    @experts = Expert.all
  end

  def create
    experts = Expert.new(expert_params)
    experts.save! ? render(json: { message: :ok }) : render(json: { message: :fail})
  end

  def show
  end

  def update
    @expert.update(expert_params) ? render(json: { message: :ok }) : render(json: { message: :fail})
  end

  def destroy
    @expert.destroy ? render(json: { message: :ok }) : render(json: { message: :fail})
  end

  private

    def expert_params
      params.permit(:name, :subject, :video_url, :article, :liked)
    end

    def expert_find
      @expert = Expert.find(params[:id])
    end
end
