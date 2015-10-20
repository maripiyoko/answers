class TopicsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_topic, only: [ :edit, :show, :destroy, :update ]

  def new
    @topic = Topic.new(topic_type: params[:topic_type])
  end

  def show
    @answer = @topic.answers.find_by_user_id(current_user)
  end

  def create
    @topic = current_user.topics.create(topic_params)
    respond_to do |format|
      if @topic.save
        format.html { redirect_to :root, notice: "#{@topic.topic_type}を作成しました。" }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @topic.update(topic_params)
        format.html { redirect_to :root, notice: "更新しました。"}
      else
        format.html { render :edit, alert: "更新できませんでした。" }
      end
    end
  end

  def destroy
    respond_to do |format|
      @topic.destroy!
      format.html { redirect_to :root, notice: '削除しました。' }
    end
  end

  private

    def set_topic
      @topic = Topic.find(params[:id])
    end

    def topic_params
      params.require(:topic).permit(:topic_type, :title, :start_date, :content, :place, :deadline_date, :state, :end_date)
    end
end
