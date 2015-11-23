require 'test_helper'

class ShowsControllerTest < ActionController::TestCase
  setup do
    @show = shows(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shows)
  end

  test "should create show" do
    assert_difference('Show.count') do
      post :create, show: { active: @show.active, image: @show.image, name: @show.name }
    end

    assert_response 201
  end

  test "should show show" do
    get :show, id: @show
    assert_response :success
  end

  test "should update show" do
    put :update, id: @show, show: { active: @show.active, image: @show.image, name: @show.name }
    assert_response 204
  end

  test "should destroy show" do
    assert_difference('Show.count', -1) do
      delete :destroy, id: @show
    end

    assert_response 204
  end
end
