require "test_helper"

class ConformOrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get conform_orders_index_url
    assert_response :success
  end
end
