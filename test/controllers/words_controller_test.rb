require 'minitest_helper'

describe WordsController do

  before do
    @word = FactoryGirl.create :word
  end

  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:words)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_create
    assert_difference('Word.count') do
      post :create, word: { name: 'hoge', group: Word::GROUPS[0], level: 1  }
    end

    assert_redirected_to word_path(assigns(:word))
  end

  def test_show
    get :show, id: @word
    assert_response :success
  end

  def test_edit
    get :edit, id: @word
    assert_response :success
  end

  def test_update
    put :update, id: @word, word: {  }
    assert_redirected_to word_path(assigns(:word))
  end

  def test_destroy
    assert_difference('Word.count', -1) do
      delete :destroy, id: @word
    end

    assert_redirected_to words_path
  end
end
