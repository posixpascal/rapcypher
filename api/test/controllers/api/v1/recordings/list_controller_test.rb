require 'test_helper'

class Api::V1::Recordings::ListControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_recordings_list_index_url
    assert_response :success
  end

end
