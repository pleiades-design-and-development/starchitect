class CommentsController < ApplicationController
  # before_action :require_login
  before_action :set_comment, only: [:show, :destroy]

def index
@comments = Comment.all
render json: @comments
end

def create
  @comment = Comment.new(comm_params)

  if @comment.save
    track_activity @comment

    render json: @comment, status: :created
  else
    render :json => { :errors => @comment.errors.full_messages }, status: :unprocessable_entity
  end
end


def destroy

  track_activity @comment

  @comment.destroy


end

private

def set_comment
  @comment = Comment.find(params[:id])
end

def comm_params
  params.permit(:body, :user_id, :commentable_id, :commentable_type)
end

end
