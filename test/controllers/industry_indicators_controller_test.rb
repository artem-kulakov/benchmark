require 'test_helper'

class IndustryIndicatorsControllerTest < ActionController::TestCase
  setup do
    @industry_indicator = industry_indicators(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:industry_indicators)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create industry_indicator" do
    assert_difference('IndustryIndicator.count') do
      post :create, industry_indicator: { indicator_id: @industry_indicator.indicator_id, industry_id: @industry_indicator.industry_id }
    end

    assert_redirected_to industry_indicator_path(assigns(:industry_indicator))
  end

  test "should show industry_indicator" do
    get :show, id: @industry_indicator
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @industry_indicator
    assert_response :success
  end

  test "should update industry_indicator" do
    patch :update, id: @industry_indicator, industry_indicator: { indicator_id: @industry_indicator.indicator_id, industry_id: @industry_indicator.industry_id }
    assert_redirected_to industry_indicator_path(assigns(:industry_indicator))
  end

  test "should destroy industry_indicator" do
    assert_difference('IndustryIndicator.count', -1) do
      delete :destroy, id: @industry_indicator
    end

    assert_redirected_to industry_indicators_path
  end
end
