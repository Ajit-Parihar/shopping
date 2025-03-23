require "test_helper"

class ProductCategoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get seller_category" do
    get product_categories_seller_category_url
    assert_response :success
  end
end
