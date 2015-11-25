class ShowsController < ApplicationController
	before_action :set_show, only: [:show, :update, :destroy]
	before_action :authenticate_member!, only: [:create, :update, :destroy]

	# GET /shows
	# GET /shows.json
	def index
		@shows = Show.where(active:true, published:true)
		render json: @shows
	end

	# POST /shows
	# POST /shows.json
	def create
		@show = Show.new(show_params)

		if @show.save
			render json: @show, status: :created, location: @show
		else
			render json: @show.errors, status: :unprocessable_entity
		end
	end

	# GET /shows/1
	# GET /shows/1.json
	def show
		render json: @show
	end

	# PATCH/PUT /shows/1
	# PATCH/PUT /shows/1.json
	def update
		if @show.update(show_params)
			head :no_content
		else
			render json: @show.errors, status: :unprocessable_entity
		end
	end

	# DELETE /shows/1
	# DELETE /shows/1.json
	def destroy
		@show.destroy

		head :no_content
	end

	private

		def set_show
			@show = Show.find(params[:id])
		end

		def show_params
			params.require(:show).permit(:name, :image, :active)
		end
end
