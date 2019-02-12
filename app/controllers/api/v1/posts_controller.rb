module Api
  module V1
    class PostsController < ApplicationController

       def index
        @posts = Post.all
        render json: @posts
      end

      def show
        @post = Post.find(params[:id])
        render json: @post
      end

      def create
        @post = Post.new(post_params)
        if @posts.save
          render json: @post
        else
          render json: { errors: @post.errors.full_messages }
        end
      end

      def update
        @post = Post.find(params[:id])
        unless @post.update(post_params)
          render json: @post
        end
      end

      def destroy
        @post = Post.find(params[:id])
        @post.destroy
      end

      private
      def post_params
        params.(:post).permit(:post, :likes, :user_id)
      end

    end
  end
end