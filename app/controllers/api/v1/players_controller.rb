module Api
  module V1
    class ChallengesController < ApplicationController
      before_action :set_game
      before_action :set_game_challenge, only: [:show, :update, :destroy]

      # GET /games/:game_id/players
      def index
        @challenges = Game.challenges.order('created_at DESC')
        render json: {status: 'SUCCESS', message: 'loaded games', data:@challenges}, status: :ok
      end

      # GET /games/:game_id/players/:id
      def show
        json_response(@item)
      end

      # POST /games/:game_id/players
      def create
        @game.challenges.create!(item_params)
        json_response(@game, :created)
      end

      # PUT /games/:game_id/players/:id
      def update
        @challenge.update(item_params)
        head :no_content
      end

      # DELETE /games/:game_id/players/:id
      def destroy
        @challenge.destroy
        head :no_content
      end


      private
      def challenge_params
        params.permit(:name, :gender, :isHost, :location, :score)
      end

      def set_game
        @game = Game.find(params[:game_id])
      end

      def set_game_challenge
        @player = @game.players.find_by!(id: params[:id]) if @game
      end
    end
  end
end;