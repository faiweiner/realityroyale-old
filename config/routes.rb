require 'api_constraints'

RrApi::Application.routes.draw do

  resources :participations, except: [:new, :edit]
	# Api definition
	namespace :api, defaults: { format: :json }, constraints: { subdomain: 'api' }, path: '/' do
		scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
			# We are going to list our resources here
		end
	end

	devise_for :users
	resources :contestants, except: [:new, :edit]
	resources :episodes, except: [:new, :edit]
	resources :leagues, except: [:new, :edit]
	resources :seasons, except: [:new, :edit]
	resources :shows, except: [:new, :edit]

	# Example resource route within a namespace:
	#   namespace :admin do
	#     # Directs /admin/products/* to Admin::ProductsController
	#     # (app/controllers/admin/products_controller.rb)
	#     resources :products
	#   end
end
