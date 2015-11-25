require 'test_helper'

class LeaguesControllerTest < ActionController::TestCase
  setup do
    @league = leagues(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:leagues)
  end

  test "should create league" do
    assert_difference('League.count') do
      post :create, league: { active: @league.active, draft_date: @league.draft_date, draft_limit: @league.draft_limit, draft_order: @league.draft_order, full: @league.full, league_key: @league.league_key, league_password: @league.league_password, locked: @league.locked, name: @league.name, participation_cap: @league.participation_cap, private: @league.private, published: @league.published, season_id: @league.season_id, type: @league.type }
    end

    assert_response 201
  end

  test "should show league" do
    get :show, id: @league
    assert_response :success
  end

  test "should update league" do
    put :update, id: @league, league: { active: @league.active, draft_date: @league.draft_date, draft_limit: @league.draft_limit, draft_order: @league.draft_order, full: @league.full, league_key: @league.league_key, league_password: @league.league_password, locked: @league.locked, name: @league.name, participation_cap: @league.participation_cap, private: @league.private, published: @league.published, season_id: @league.season_id, type: @league.type }
    assert_response 204
  end

  test "should destroy league" do
    assert_difference('League.count', -1) do
      delete :destroy, id: @league
    end

    assert_response 204
  end
end
