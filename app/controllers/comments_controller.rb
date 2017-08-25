class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :destroy]

def index
@comments = Comment.all
render json: @comments
end

def create
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
