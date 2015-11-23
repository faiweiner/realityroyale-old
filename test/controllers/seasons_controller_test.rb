require 'test_helper'

class SeasonsControllerTest < ActionController::TestCase
  setup do
    @season = seasons(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:seasons)
  end

  test "should create season" do
    assert_difference('Season.count') do
      post :create, season: { active: @season.active, country_origin: @season.country_origin, description: @season.description, episode_count: @season.episode_count, finale_date: @season.finale_date, image: @season.image, name: @season.name, network: @season.network, number: @season.number, premiere_date: @season.premiere_date, published: @season.published, show_id: @season.show_id, type: @season.type, website: @season.website }
    end

    assert_response 201
  end

  test "should show season" do
    get :show, id: @season
    assert_response :success
  end

  test "should update season" do
    put :update, id: @season, season: { active: @season.active, country_origin: @season.country_origin, description: @season.description, episode_count: @season.episode_count, finale_date: @season.finale_date, image: @season.image, name: @season.name, network: @season.network, number: @season.number, premiere_date: @season.premiere_date, published: @season.published, show_id: @season.show_id, type: @season.type, website: @season.website }
    assert_response 204
  end

  test "should destroy season" do
    assert_difference('Season.count', -1) do
      delete :destroy, id: @season
    end

    assert_response 204
  end
end
