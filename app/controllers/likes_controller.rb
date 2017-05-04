class LikesController < ApplicationController
  before_action :load_likeable

  def join
    @like = @likeable.likes.new
    @like.user_id = current_user.id
    @like.save
    redirect_to :back
  end

  def del
    @like = current_user.likes.where(likeable_type: @resource, likeable_id: @id)
    if Like.find(@like.to_a[0].id).destroy
      redirect_to :back
    end

  end


  private

  def load_likeable
    resource, id = request.path.split('/')[1,2]
    @resource = resource.classify
    @id = id
    @likeable = resource.singularize.classify.constantize.find(id)
  end
end
