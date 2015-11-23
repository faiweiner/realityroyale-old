class EpisodesController < ApplicationController
  before_action :set_episode, only: [:show, :update, :destroy]

  # GET /episodes
  # GET /episodes.json
  def index
    @episodes = Episode.all

    render json: @episodes
  end

  # GET /episodes/1
  # GET /episodes/1.json
  def show
    render json: @episode
  end

  # POST /episodes
  # POST /episodes.json
  def create
    @episode = Episode.new(episode_params)

    if @episode.save
      render json: @episode, status: :created, location: @episode
    else
      render json: @episode.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /episodes/1
  # PATCH/PUT /episodes/1.json
  def update
    @episode = Episode.find(params[:id])

    if @episode.update(episode_params)
      head :no_content
    else
      render json: @episode.errors, status: :unprocessable_entity
    end
  end

  # DELETE /episodes/1
  # DELETE /episodes/1.json
  def destroy
    @episode.destroy

    head :no_content
  end

  private

    def set_episode
      @episode = Episode.find(params[:id])
    end

    def episode_params
      params.require(:episode).permit(:season_id, :air_date, :survivor_count, :published, :aired)
    end
end
