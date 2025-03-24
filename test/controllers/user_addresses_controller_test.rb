require "test_helper"

class UserAddressesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_addresses_index_url
    assert_response :success
  end

  test "should get new" do
    get user_addresses_new_url
    assert_response :success
  end
end
