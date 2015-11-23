RrApi::Application.routes.draw do

	# Api definition
	namespace :api, defaults: { format: :json }, constraints: { subdomain: 'api' }, path: '/' do
		# We are going to list our resources here
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
