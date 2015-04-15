class CommentsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_map

  def new
    @comment = Comment.new
  end

  def create
    @comment = @map.comments.new(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to map_url(@map)
    else
      render :template => "maps/show"
    end
  end

  def destroy
    @comment = @map.comments.find( params[:id] )

    if @comment.can_delete_by?(current_user)
      @comment.destroy
    end

    redirect_to :back

  end


  protected

  def comment_params
    params.require(:comment).permit(:content)
  end

  def set_map
    @map = Map.find(params[:map_id])
  end
end
