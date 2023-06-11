require "test_helper"

class Public::MoviesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_movies_index_url
    assert_response :success
  end

  test "should get show" do
    get public_movies_show_url
    assert_response :success
  end
end
