class TopicsController < ApplicationController
  def index
    @topics = Topic.order(:name).where("name like ?", "%#{params[:term]}%")
    render json: @topics.map(&:name)
  end
end
