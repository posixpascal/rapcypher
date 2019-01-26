require 'test_helper'

class Api::V1::Users::LoginControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_users_login_index_url
    assert_response :success
  end

  test "should get create" do
    get api_v1_users_login_create_url
    assert_response :success
  end

end
