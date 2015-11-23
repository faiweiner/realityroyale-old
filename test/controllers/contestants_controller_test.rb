require 'test_helper'

class ContestantsControllerTest < ActionController::TestCase
  setup do
    @contestant = contestants(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contestants)
  end

  test "should create contestant" do
    assert_difference('Contestant.count') do
      post :create, contestant: { active: @contestant.active, age: @contestant.age, description: @contestant.description, gender: @contestant.gender, image: @contestant.image, name: @contestant.name, occupation: @contestant.occupation, published: @contestant.published }
    end

    assert_response 201
  end

  test "should show contestant" do
    get :show, id: @contestant
    assert_response :success
  end

  test "should update contestant" do
    put :update, id: @contestant, contestant: { active: @contestant.active, age: @contestant.age, description: @contestant.description, gender: @contestant.gender, image: @contestant.image, name: @contestant.name, occupation: @contestant.occupation, published: @contestant.published }
    assert_response 204
  end

  test "should destroy contestant" do
    assert_difference('Contestant.count', -1) do
      delete :destroy, id: @contestant
    end

    assert_response 204
  end
end
