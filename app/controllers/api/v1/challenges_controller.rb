module Api
  module V1
    class ChallengesController < ApplicationController
      before_action :set_game, only: [:show, :update, :destroy, :start]

      # GET /challenges
      def index
        @games = Game.order('created_at DESC')
        render json: {status: 'SUCCESS', message: 'loaded games', data:@games}, status: :ok
      end

      # GET /challenges/:game_id
      def show
        json_response(@game)
      end

      # GET /games/:game_id/players
      def show
        @players = Game.players.order('created_at DESC')
        json_response(@game)
      end

      # POST /challenges
      def create
        @game = Game.create!(game_params)
        json_response(@game, :created)
      end

      private

      def game_params
        params.permit(:duration, :center, :startRadius)
      end

      def set_game
        @game = Game.find(params[:game_id])
      end

    end
  end
end;