class AnswersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_topic
  before_action :set_answer, only: [ :destroy ]

  def create
    @answer = @topic.answers.build(answer_params)
    @answer.user = current_user
    respond_to do |format|
      if @answer.save
        format.html { redirect_to topic_path(@topic), notice: '回答しました。' }
      else
        format.html { redirect_to topic_path(@topic), alert: '回答出来ませんでした。' }
      end
    end
  end

  def destroy
    @answer.destroy!
    redirect_to topic_path(@topic), notice: '回答を取り消しました。'
  end

  private

    def set_topic
      @topic = Topic.find(params[:topic_id])
    end

    def set_answer
      @answer = @topic.answers.find_by_user_id(current_user)
    end
  
    def answer_params
      params.require(:answer).permit(:answer_type, :message, :topic_id)
    end
end
