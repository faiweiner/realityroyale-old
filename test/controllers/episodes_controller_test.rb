require 'test_helper'

class EpisodesControllerTest < ActionController::TestCase
  setup do
    @episode = episodes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:episodes)
  end

  test "should create episode" do
    assert_difference('Episode.count') do
      post :create, episode: { air_date: @episode.air_date, aired: @episode.aired, published: @episode.published, season_id: @episode.season_id, survivor_count: @episode.survivor_count }
    end

    assert_response 201
  end

  test "should show episode" do
    get :show, id: @episode
    assert_response :success
  end

  test "should update episode" do
    put :update, id: @episode, episode: { air_date: @episode.air_date, aired: @episode.aired, published: @episode.published, season_id: @episode.season_id, survivor_count: @episode.survivor_count }
    assert_response 204
  end

  test "should destroy episode" do
    assert_difference('Episode.count', -1) do
      delete :destroy, id: @episode
    end

    assert_response 204
  end
end
