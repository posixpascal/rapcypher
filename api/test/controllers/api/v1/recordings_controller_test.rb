require 'test_helper'

class Api::V1::RecordingsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_recordings_index_url
    assert_response :success
  end

  test "should get create" do
    get api_v1_recordings_create_url
    assert_response :success
  end

  test "should get show" do
    get api_v1_recordings_show_url
    assert_response :success
  end

  test "should get delete" do
    get api_v1_recordings_delete_url
    assert_response :success
  end

  test "should get update" do
    get api_v1_recordings_update_url
    assert_response :success
  end

  test "should get new" do
    get api_v1_recordings_new_url
    assert_response :success
  end

  test "should get edit" do
    get api_v1_recordings_edit_url
    assert_response :success
  end

end
