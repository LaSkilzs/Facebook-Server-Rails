module Api
  module V1
    class PhotosController < ApplicationController

       def index
        @photos = Photo.all
        render json: @photos
      end

      def show
        @photos = Photo.find(params[:id])
        render json: @photos
      end

      def create
        @photos = Photo.new(photo_params)
        if @photos.save
          render json: @photos
        else
          render json: { errors: @photos.errors.full_messages }
        end
      end

      def update
        @photos = Photo.find(params[:id])
        unless @photos.update(photo_params)
          render json: @photos
        end
      end

      def destroy
        @photos = Photo.find(params[:id])
        @photos.destroy
      end

      private
      def photo_params
        params.(:photo).permit(:name, :image, :details, :user_id)
      end

    end
  end
end