class SeasonsController < ApplicationController
  before_action :set_season, only: [:show, :update, :destroy]

  # GET /seasons
  # GET /seasons.json
  def index
    @seasons = Season.all

    render json: @seasons
  end

  # GET /seasons/1
  # GET /seasons/1.json
  def show
    render json: @season
  end

  # POST /seasons
  # POST /seasons.json
  def create
    @season = Season.new(season_params)

    if @season.save
      render json: @season, status: :created, location: @season
    else
      render json: @season.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /seasons/1
  # PATCH/PUT /seasons/1.json
  def update
    if @season.update(season_params)
      head :no_content
    else
      render json: @season.errors, status: :unprocessable_entity
    end
  end

  # DELETE /seasons/1
  # DELETE /seasons/1.json
  def destroy
    @season.destroy

    head :no_content
  end

  private

    def set_season
      @season = Season.find(params[:id])
    end

    def season_params
      params.require(:season).permit(:name, :number, :show_id, :country_origin, :type, :description, :image, :website, :network, :premiere_date, :finale_date, :episode_count, :active, :published)
    end
end
