require 'test_helper'

class FxRatesControllerTest < ActionController::TestCase
  setup do
    @fx_rate = fx_rates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fx_rates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fx_rate" do
    assert_difference('FxRate.count') do
      post :create, fx_rate: { currency_id: @fx_rate.currency_id, day_id: @fx_rate.day_id, rate: @fx_rate.rate }
    end

    assert_redirected_to fx_rate_path(assigns(:fx_rate))
  end

  test "should show fx_rate" do
    get :show, id: @fx_rate
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fx_rate
    assert_response :success
  end

  test "should update fx_rate" do
    patch :update, id: @fx_rate, fx_rate: { currency_id: @fx_rate.currency_id, day_id: @fx_rate.day_id, rate: @fx_rate.rate }
    assert_redirected_to fx_rate_path(assigns(:fx_rate))
  end

  test "should destroy fx_rate" do
    assert_difference('FxRate.count', -1) do
      delete :destroy, id: @fx_rate
    end

    assert_redirected_to fx_rates_path
  end
end
