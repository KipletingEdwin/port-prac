class CommentsController < ApplicationController

    def index
        comment = Comment.all
        render json: comment, status: :ok
    end

    def show
        comment = find_comment
        render json: comment
    end

    private

    def find_comment
        Comment.find(params[:id])

    end
end
