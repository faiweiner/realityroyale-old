class ParticipantsController < ApplicationController
	before_action :set_participant, only: [:show, :show_rounds, :create_rounds, :update, :destroy]

	# GET /participants
	# GET /participants.json
	def index
		@participants = Participant.all

		render json: @participants
	end

	# GET /participants/1
	# GET /participants/1.json
	def show
		render json: @participant
	end

	# GET /participants/1/rounds
	# GET /participants/1/rounds.json
	def show_rounds
		@rounds = @participant.rounds
		render json: @rounds
	end

	# POST /participants
	# POST /participants.json
	def create
		@participant = Participant.new(participant_params)

		if @participant.save
			render json: @participant, status: :created, location: @participant
		else
			render json: @participant.errors, status: :unprocessable_entity
		end
	end

	# POST /participants/1/rounds
	# POST /participants/1/rounds.json
	def create_rounds
		@rounds = []
		case @participant.league.type
		when "Fantasy"
			@rounds = ["fantasy"]
		when "Elimination"
			@rounds = ["elimination"]
		end
		render json: @rounds
	end

	# PATCH/PUT /participants/1
	# PATCH/PUT /participants/1.json
	def update
		@participant = Participant.find(params[:id])

		if @participant.update(participant_params)
			head :no_content
		else
			render json: @participant.errors, status: :unprocessable_entity
		end
	end

	# DELETE /participants/1
	# DELETE /participants/1.json
	def destroy
		@participant.destroy

		head :no_content
	end

	private

		def set_participant
			@participant = Participant.find(params[:id])
		end

		def participant_params
			params.require(:participant).permit(:league_id, :user_id, :commissioner, :score)
		end
end
