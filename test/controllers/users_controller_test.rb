require 'test_helper'

class ContestantsControllerTest < ActionController::TestCase
	include Devise::TestHelpers

	def setup
		@request.env["devise.mapping"] = Devise.mappings[:admin]
		confirm!
		sign_in FactoryGirl.create(:admin)
	end
end