require "minitest_helper"

describe GamesController do

  before do
    @game = games(:one)
  end

  it "must get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:games)
  end

  it "must get new" do
    get :new
    assert_response :success
  end

  it "must create game" do
    assert_difference('Game.count') do
      post :create, game: {  }
    end

    assert_redirected_to game_path(assigns(:game))
  end

  it "must show game" do
    get :show, id: @game
    assert_response :success
  end

  it "must get edit" do
    get :edit, id: @game
    assert_response :success
  end

  it "must update game" do
    put :update, id: @game, game: {  }
    assert_redirected_to game_path(assigns(:game))
  end

  it "must destroy game" do
    assert_difference('Game.count', -1) do
      delete :destroy, id: @game
    end

    assert_redirected_to games_path
  end

end
