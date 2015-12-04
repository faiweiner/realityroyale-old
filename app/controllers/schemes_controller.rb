class SchemesController < ApplicationController
	before_action :set_scheme, only: [:display, :update, :destroy]

	# GET /schemes
	# GET /schemes.json
	def index
		@schemes = Scheme.all

		render json: @schemes
	end

	# GET /schemes/1
	# GET /schemes/1.json
	def display
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

	# PUT /schemes/1
	# PUT /schemes/1.json
	def update
		if @scheme.update(scheme_params)
			head :no_content
		else
			render json: @scheme.errors, status: :unprocessable_entity
		end
	end

	# PATCH /schemes/1
	# PATCH /schemes/1.json
	def bulk_activate
		scheme_ids = params[:ids]
		@response = {}
		scheme_ids.each do |id|
			scheme = Scheme.find[id]
			scheme.toggle_active_field
			# FIXME!
			if scheme.updated? 
				head :no_contest 
			else
				render json @response.errors, status: :unprocessable_entity
			end
		end
	end

	# PATCH /schemes/1/publish
	# PATCH /schemes/1/publish.json
	def publish
		if @scheme.toggle_publish_field
			head :no_content
		else
			render json: @scheme.errors, status: :unprocessable_entity
		end
	end

	# PATCH /schemes/1/unpublish
	# PATCH /schemes/1/unpublish.json
	def unpublish
		if @scheme.update(scheme_params)
			head :no_content
		else
			render json: @scheme.errors, status: :unprocessable_entity
		end
	end

	# PATCH /schemes/1/activate
	# PATCH /schemes/1/activate.json
	def activate
		if @scheme.update(scheme_params)
			head :no_content
		else
			render json: @scheme.errors, status: :unprocessable_entity
		end
	end

	# PATCH /schemes/1/deactivate
	# PATCH /schemes/1/deactivate.json
	def deactivate
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
