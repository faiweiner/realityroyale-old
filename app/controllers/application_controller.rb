class ApplicationController < ActionController::API
	before_action :set_instance
	def activate
		@instance.toggle_active_field
		render json: @instance
	end

	private

	def set_instance
		# FIXME! keep usual functions like activate, publish, close out, etc. dry within controllers
	end
end
