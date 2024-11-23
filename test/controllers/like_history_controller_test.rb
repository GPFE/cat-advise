require "test_helper"

class LikeHistoryControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get like_history_index_url
    assert_response :success
  end
end
