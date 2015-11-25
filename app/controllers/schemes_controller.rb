class SchemesController < ApplicationController
  before_action :set_scheme, only: [:show, :update, :destroy]

  # GET /schemes
  # GET /schemes.json
  def index
    @schemes = Scheme.all

    render json: @schemes
  end

  # GET /schemes/1
  # GET /schemes/1.json
  def show
    render json: @scheme
  end

  # POST /schemes
  # POST /schemes.json
  def create
    @scheme = Scheme.new(scheme_params)

    if @scheme.save
      render json: @scheme, status: :created, location: @scheme
    else
      render json: @scheme.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /schemes/1
  # PATCH/PUT /schemes/1.json
  def update
    @scheme = Scheme.find(params[:id])

    if @scheme.update(scheme_params)
      head :no_content
    else
      render json: @scheme.errors, status: :unprocessable_entity
    end
  end

  # DELETE /schemes/1
  # DELETE /schemes/1.json
  def destroy
    @scheme.destroy

    head :no_content
  end

  private

    def set_scheme
      @scheme = Scheme.find(params[:id])
    end

    def scheme_params
      params.require(:scheme).permit(:show_id, :type, :description, :points, :active, :published)
    end
end
