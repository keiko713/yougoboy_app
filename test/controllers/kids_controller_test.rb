require "minitest_helper"

describe KidsController do

  before do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    sign_in FactoryGirl.create(:user)
    @kid = FactoryGirl.create :kid
  end

  it "must get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:kids)
  end

  it "must get new" do
    get :new
    assert_response :success
  end

  it "must create kid" do
    assert_difference('Kid.count') do
      post :create, kid: {  }
    end

    assert_redirected_to root_path
  end

  it "must show kid" do
    get :show, id: @kid
    assert_response :success
  end

  it "must get edit" do
    get :edit, id: @kid
    assert_response :success
  end

  it "must update kid" do
    put :update, id: @kid, kid: {  }
    assert_redirected_to kid_path(assigns(:kid))
  end

  it "must destroy kid" do
    assert_difference('Kid.count', -1) do
      delete :destroy, id: @kid
    end

    assert_redirected_to kids_path
  end

end
