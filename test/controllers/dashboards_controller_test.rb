require 'test_helper'

class DashboardsControllerTest < ActionDispatch::IntegrationTest
  test "should get startup" do
    get dashboards_startup_url
    assert_response :success
  end

  test "should get tester" do
    get dashboards_tester_url
    assert_response :success
  end

end
