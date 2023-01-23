class GymsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_record_not_found_response
  before_action :set_gym, only: [:show]
      def show
          gym = find_gym
          render json: gym
      end

      def index
          render json: Gym.all
      end

      def destroy
          gym = find_gym
          if gym
              gym.destroy
              head :no_content
          else
              render json: {error: "Gym not found"}
          end
      end

      private
      def render_record_not_found_response
          render json: { error: "Gym not Found" }, status: :not_found
      end

      def find_gym
          Gym.find(params[:id])
      end
  end
