require "test_helper"

class ItemGenresControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get item_genres_search_url
    assert_response :success
  end
end
