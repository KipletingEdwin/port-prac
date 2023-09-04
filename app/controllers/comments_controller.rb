class CommentsController < ApplicationController
rescue_from ActiverRecord: :RecordInvalid, with: :render_unprocessable_entity_response

    def index
        comment = Comment.all
        render json: comment, status: :ok
    end

    def show
        comment = find_comment
        render json: comment
    end

    def create
        comment = Comment.create(comment_params)
        render json: article, status: :created
    end

    def update
        comment = find_comment
        comment.update(comment_params)
        render json: comment, status: :ok
    end

    def destroy
        comment = find_comment
        comment.destroy
        head :no_content
    end

    private

    def find_comment
        Comment.find(params[:id])
    end

    def comment_params
        params.permit(:commentor, :body)
    end

    def render_unprocessable_entity_response(exception)
        render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
    end
end
