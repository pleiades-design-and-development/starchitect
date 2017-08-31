class CommentsController < ApplicationController
  before_action :require_login, only: [ :create, :update, :destroy]
  before_action :set_comment, only: [:show, :destroy]

def index
@comments = Comment.all
render json: @comments
end

def create
  track_activity @comment

end

def destroy
end

private

def set_comment
  @comment = Comment.find(params[:id])
end

def comm_params
  params.permit(:body)
end

end
