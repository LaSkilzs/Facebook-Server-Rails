module Api
  module V1
    class ProfilesController < ApplicationController

      def index
        @profiles = Profile.all
        render json: @profiles
      end

      def show
        @profile = Profile.find(params[:id])
        render json: @profile
      end

      def create
        @profile = Profile.new(profile_params)
        if @profile.save
          render json: @profile
        else
          render json: { errors: @profile.errors.full_messages }
        end
      end

      def update
        @profile = Profile.find(params[:id])
        unless @profile.update(profile_params)
          render json: @profile
        end
      end

      def destroy
        @profile = Profile.find(params[:id])
        @profile.destroy
      end

      private
      def profile_params
        params.(:profile).permit(:name, :address, :birthday, :phone, :location, :movie, :animal, :sport, :interests, :image1, :image2, :friends, :followers, :user_id)
      end
    end
  end
end