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

    private

    def find_comment
        Comment.find(params[:id])

    end

    def render_unprocessable_entity_response(exception)
        render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
    end
end
