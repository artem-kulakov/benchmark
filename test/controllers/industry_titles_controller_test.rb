require 'test_helper'

class IndustryTitlesControllerTest < ActionController::TestCase
  setup do
    @industry_title = industry_titles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:industry_titles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create industry_title" do
    assert_difference('IndustryTitle.count') do
      post :create, industry_title: { industry_id: @industry_title.industry_id, title: @industry_title.title, user_id: @industry_title.user_id }
    end

    assert_redirected_to industry_title_path(assigns(:industry_title))
  end

  test "should show industry_title" do
    get :show, id: @industry_title
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @industry_title
    assert_response :success
  end

  test "should update industry_title" do
    patch :update, id: @industry_title, industry_title: { industry_id: @industry_title.industry_id, title: @industry_title.title, user_id: @industry_title.user_id }
    assert_redirected_to industry_title_path(assigns(:industry_title))
  end

  test "should destroy industry_title" do
    assert_difference('IndustryTitle.count', -1) do
      delete :destroy, id: @industry_title
    end

    assert_redirected_to industry_titles_path
  end
end
