require 'test_helper'

class AccountingStandardsControllerTest < ActionController::TestCase
  setup do
    @accounting_standard = accounting_standards(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:accounting_standards)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create accounting_standard" do
    assert_difference('AccountingStandard.count') do
      post :create, accounting_standard: { title: @accounting_standard.title }
    end

    assert_redirected_to accounting_standard_path(assigns(:accounting_standard))
  end

  test "should show accounting_standard" do
    get :show, id: @accounting_standard
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @accounting_standard
    assert_response :success
  end

  test "should update accounting_standard" do
    patch :update, id: @accounting_standard, accounting_standard: { title: @accounting_standard.title }
    assert_redirected_to accounting_standard_path(assigns(:accounting_standard))
  end

  test "should destroy accounting_standard" do
    assert_difference('AccountingStandard.count', -1) do
      delete :destroy, id: @accounting_standard
    end

    assert_redirected_to accounting_standards_path
  end
end
