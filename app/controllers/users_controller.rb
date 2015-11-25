class UsersController < ApplicationController
	before_action :set_user, only: [:show, :show_favorites, :update, :destroy]
	# GET /users/1
	# GET /users/1.json
	def show
		respond_with User.find(params[:id])
	end

	# GET /users/1/favorites
	# GET /users/1/favorites.json
	def show_favorites
	end	

	def create
		user = User.new(user_params) 
		if user.save
			render json: user, status: 201, location: [:api, user] 
		else
			render json: { errors: user.errors }, status: 422
		end
	end

	def update
		if user.update(user_params)
			render json: user, status: 200, location: [:api, user] 
		else
			render json: { errors: user.errors }, status: 422
		end
	end

	def destroy
		user.destroy
		head 204
	end

	private

	def set_user
		user = User.find(params[:id]) 
	end

	def user_params
		params.require(:user).permit(:email, :password, :password_confirmation) 
	end

end
