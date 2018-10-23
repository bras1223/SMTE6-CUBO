# frozen_string_literal: true

module Api
  module V1
    class GamesController < ApplicationController
      before_action :set_game, only: %i[show update destroy start end]

      # GET /games
      def index
        @games = Game.order('created_at DESC')
        json_response(@games)
      end

      # GET /games/:game_id
      def show
        json_response(@game)
      end

      # POST /games
      def create
        @game = Game.create!(game_params)
        json_response(@game, :created)
      end

      # PUT /games/:id
      def update
        @game.update(update_game_params)
        head :no_content
        json_response(@game, :updated)
      end

      # PUT /games/:id/start
      def start
        @game.start
        json_response(@game, :updated)
      end

      # PUT /games/:id/end
      def end
        @game.end
        json_response(@game, :updated)
      end

      private

      def game_params
        params.permit(:duration, :playerCount, :center, :startRadius)
      end

      def set_game
        @game = Game.find_by(joinCode: params[:id]) || Game.find(params[:id])
      end
    end
  end
end
