require "test_helper"

class Public::ReviewsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get public_reviews_edit_url
    assert_response :success
  end

  test "should get index" do
    get public_reviews_index_url
    assert_response :success
  end

  test "should get shoe" do
    get public_reviews_shoe_url
    assert_response :success
  end
end
