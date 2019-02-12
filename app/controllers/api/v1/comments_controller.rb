module Api
  module V1
    class CommentsController < ApplicationController

      def index
        @comments = Comment.all
        if @comments
          render json: @comments
        else
          render json: { errors: @comments.errors.full_messages }
        end
      end

      def create
        @comment = Comment.new(comment_params)

        if @comment.save
          render json: @comment
        else
          render json: { errors: @comment.errors.full_messages }
        end
      end

      def show
        @comment = Comment.find(params[:id])
        render json: @comment
      end

      def update
        @comment = Comment.find_by(id: params[:id])
        unless @comment.update(comment_params)
          render json: @comment
        end
      end

      def destroy
        @comment = Comment.find(params[:id])
        @comment.destroy
      end

      private
      def comment_params
        params.require(:comment).permit(:comment, :likes, :user_id)
      end


    end
  end
end