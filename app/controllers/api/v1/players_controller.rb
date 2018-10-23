module Api
  module V1
    class PlayersController < ApplicationController
      before_action :set_game
      before_action :set_game_player, only: [:show, :update, :destroy]

      # GET /games/:game_id/players
      def index
        @players = @game.players.order('created_at DESC')
        render json: {status: 'SUCCESS', message: 'loaded players', data:@players}, status: :ok
      end

      # GET /games/:game_id/players/:id
      def show
        json_response(@item)
      end

      # POST /games/:game_id/players
      def create
        if @game.reached_max_players
          json_response({}, :forbidden)
        else
          @game.players.create!(player_params)
          json_response(@game, :created)
        end
      end

      # PUT /games/:game_id/players/:id
      def update
        @player.update(player_params)
        head :no_content
      end

      # DELETE /games/:game_id/players/:id
      def destroy
        @challenge.destroy
        head :no_content
      end


      private
      def player_params
        params.permit(:name, :gender, :isHost, :location, :score)
      end

      def set_game
        @game = Game.find_by(joinCode: params[:game_id]) || Game.find(params[:game_id])
      end

      def set_game_player
        @player = @game.players.find_by!(id: params[:id]) if @game
      end
    end
  end
end;