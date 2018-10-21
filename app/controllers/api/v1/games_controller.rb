module Api
  module V1
    class GamesController < ApplicationController
      before_action :set_game, only: [:show, :update, :destroy, :start, :end]

      # GET /games
      def index
        @games = Game.order('created_at DESC')
        render json: {status: 'SUCCESS', message: 'loaded games', data:@games}, status: :ok
      end

      # GET /games/:game_id
      def show
        json_response(@game)
      end

      # GET /games/:game_id/players
      def show
        @players = Game.players.order('created_at DESC')
        json_response(@game)
      end

      # POST /games
      def create
        @game = Game.create!(game_params)
        json_response(@game, :created)
      end

      # PUT /games/:game_id
      def update
        @game.update(update_game_params)
        head :no_content
        json_response(@game, :updated)
      end

      # PUT /games/:game_id/start
      def start
        @game.start
        json_response(@game, :updated)
      end

      # PUT /games/:game_id/end
      def end
        @game.end
        json_response(@game, :updated)
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