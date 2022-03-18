require "test_helper"

class BrandControllerTest < ActionDispatch::IntegrationTest
  test "should get Index" do
    get brand_Index_url
    assert_response :success
  end
end
