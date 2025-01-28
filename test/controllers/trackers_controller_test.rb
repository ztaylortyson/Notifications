require "test_helper"

class TrackersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get trackers_index_url
    assert_response :success
  end

  test "should get create" do
    get trackers_create_url
    assert_response :success
  end

  test "should get edit" do
    get trackers_edit_url
    assert_response :success
  end

  test "should get update" do
    get trackers_update_url
    assert_response :success
  end

  test "should get destroy" do
    get trackers_destroy_url
    assert_response :success
  end
end
