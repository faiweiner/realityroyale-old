class LeaguesController < ApplicationController
	before_action :set_league, only: [:show, :update, :destroy]

	# GET /leagues
	# GET /leagues.json
	def index
		@leagues = League.all
		render json: @leagues
	end

	# GET /leagues/fantasy
	# GET /leagues/fantasy.json
	def index
		@leagues = Fantasy.where(private_access: false, active: true, published: true, full:false, locked:false)
		render json: @leagues
	end

	# GET /leagues/elimination
	# GET /leagues/elimination.json
	def index
		@leagues = Elimination.where(private_access: false, active: true, published: true, full:false, locked:false)
		render json: @leagues
	end
	

	# GET /leagues/1
	# GET /leagues/1.json
	def show
		render json: @league
	end

	# POST /leagues
	# POST /leagues.json
	def create
		@league = League.new(league_params)

		if @league.save
			render json: @league, status: :created, location: @league
		else
			render json: @league.errors, status: :unprocessable_entity
		end
	end

	# PATCH/PUT /leagues/1
	# PATCH/PUT /leagues/1.json
	def update
		@league = League.find(params[:id])

		if @league.update(league_params)
			head :no_content
		else
			render json: @league.errors, status: :unprocessable_entity
		end
	end

	# DELETE /leagues/1
	# DELETE /leagues/1.json
	def destroy
		@league.destroy

		head :no_content
	end

	private

		def set_league
			@league = League.find(params[:id])
		end

		def league_params
			params.require(:league).permit(:name, :season_id, :type, :participation_cap, :draft_limit, :draft_date, :draft_order, :league_key, :league_password, :private, :active, :published, :full, :locked)
		end
end
