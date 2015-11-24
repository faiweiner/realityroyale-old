class ParticipationsController < ApplicationController
  before_action :set_participation, only: [:show, :update, :destroy]

  # GET /participations
  # GET /participations.json
  def index
    @participations = Participation.all

    render json: @participations
  end

  # GET /participations/1
  # GET /participations/1.json
  def show
    render json: @participation
  end

  # POST /participations
  # POST /participations.json
  def create
    @participation = Participation.new(participation_params)

    if @participation.save
      render json: @participation, status: :created, location: @participation
    else
      render json: @participation.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /participations/1
  # PATCH/PUT /participations/1.json
  def update
    @participation = Participation.find(params[:id])

    if @participation.update(participation_params)
      head :no_content
    else
      render json: @participation.errors, status: :unprocessable_entity
    end
  end

  # DELETE /participations/1
  # DELETE /participations/1.json
  def destroy
    @participation.destroy

    head :no_content
  end

  private

    def set_participation
      @participation = Participation.find(params[:id])
    end

    def participation_params
      params.require(:participation).permit(:league_id, :user_id, :commissioner)
    end
end
