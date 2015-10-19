class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_topic

  def create
    @comment = @topic.comments.build(comment_params)
    @comment.user = current_user
    respond_to do |format|
      if @comment.save
        format.js
      end
    end
  end

  def destroy
    @comment = @topic.comments.find(params[:id])
    respond_to do |format|
      if @comment.user == current_user
        @comment.destroy!
        format.js
      end
    end
  end

  private

    def set_topic
      @topic = Topic.find(params[:topic_id])
    end

    def comment_params
      params.require(:comment).permit(:topic_id, :comment)
    end
end
