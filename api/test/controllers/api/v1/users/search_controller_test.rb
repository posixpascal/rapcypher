require 'test_helper'

class Api::V1::Users::SearchControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get api_v1_users_search_show_url
    assert_response :success
  end

end
