class LikesController < ApplicationController
  before_action :load_likeable


  def create
    @like = @likeable.likes.new
    @like.user_id = current_user.id
    @like.save
    redirect_to :back

  end

  private

  def load_likeable
    resource, id = request.path.split('/')[1,2]
    @likeable = resource.singularize.classify.constantize.find(id)
  end
end
