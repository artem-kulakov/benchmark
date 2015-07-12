require 'test_helper'

class FaceControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_select 'p', 'Here is a list of reports we have:'
    assert_select '.entry', 5
  end

end
