require "test_helper"

class FollowRequestsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get follow_requests_new_url
    assert_response :success
  end
end
