class RoundsController < ApplicationController
  before_action :set_round, only: [:show, :update, :destroy]

  # GET /rounds
  # GET /rounds.json
  def index
    @rounds = Round.all

    render json: @rounds
  end

  # GET /rounds/1
  # GET /rounds/1.json
  def show
    render json: @round
  end

  # POST /rounds
  # POST /rounds.json
  def create
    @round = Round.new(round_params)

    if @round.save
      render json: @round, status: :created, location: @round
    else
      render json: @round.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /rounds/1
  # PATCH/PUT /rounds/1.json
  def update
    @round = Round.find(params[:id])

    if @round.update(round_params)
      head :no_content
    else
      render json: @round.errors, status: :unprocessable_entity
    end
  end

  # DELETE /rounds/1
  # DELETE /rounds/1.json
  def destroy
    @round.destroy

    head :no_content
  end

  private

    def set_round
      @round = Round.find(params[:id])
    end

    def round_params
      params.require(:round).permit(:participant_id, :type, :episode_id, :score)
    end
end
