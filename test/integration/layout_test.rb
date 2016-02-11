require 'test_helper'

class LayoutTest < ActionDispatch::IntegrationTest
  test "layout links" do
    get root_path
    assert_template 'reports/index'
    assert_select 'a[href=?]', root_path
    assert_select 'a[href=?]', reports_path
    assert_select 'a[href=?]', industries_path
    assert_select 'a[href=?]', companies_path
    assert_select 'a[href=?]', indicators_path
    assert_select 'a[href=?]', periods_path
    assert_select 'a[href=?]', topics_path
    assert_select 'a[href=?]', signup_path
    
    get signup_path
    assert_template 'users/new'
    assert_select 'title', '/signup'
  end
end
