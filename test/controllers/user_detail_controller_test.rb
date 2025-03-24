require "test_helper"

class UserDetailControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_detail_index_url
    assert_response :success
  end

  test "should get new" do
    get user_detail_new_url
    assert_response :success
  end
end
