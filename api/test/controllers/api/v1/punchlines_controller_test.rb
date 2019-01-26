require 'test_helper'

class Api::V1::PunchlinesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_punchlines_index_url
    assert_response :success
  end

  test "should get create" do
    get api_v1_punchlines_create_url
    assert_response :success
  end

  test "should get update" do
    get api_v1_punchlines_update_url
    assert_response :success
  end

  test "should get edit" do
    get api_v1_punchlines_edit_url
    assert_response :success
  end

  test "should get new" do
    get api_v1_punchlines_new_url
    assert_response :success
  end

  test "should get show" do
    get api_v1_punchlines_show_url
    assert_response :success
  end

end
