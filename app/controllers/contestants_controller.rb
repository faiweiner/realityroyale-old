class ContestantsController < ApplicationController
  before_action :set_contestant, only: [:show, :update, :destroy]

  # GET /contestants
  # GET /contestants.json
  def index
    @contestants = Contestant.all

    render json: @contestants
  end

  # GET /contestants/1
  # GET /contestants/1.json
  def show
    render json: @contestant
  end

  # POST /contestants
  # POST /contestants.json
  def create
    @contestant = Contestant.new(contestant_params)

    if @contestant.save
      render json: @contestant, status: :created, location: @contestant
    else
      render json: @contestant.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /contestants/1
  # PATCH/PUT /contestants/1.json
  def update
    @contestant = Contestant.find(params[:id])

    if @contestant.update(contestant_params)
      head :no_content
    else
      render json: @contestant.errors, status: :unprocessable_entity
    end
  end

  # DELETE /contestants/1
  # DELETE /contestants/1.json
  def destroy
    @contestant.destroy

    head :no_content
  end

  private

    def set_contestant
      @contestant = Contestant.find(params[:id])
    end

    def contestant_params
      params.require(:contestant).permit(:name, :image, :age, :gender, :occupation, :description, :active, :published)
    end
end
