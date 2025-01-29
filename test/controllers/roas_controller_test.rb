require "test_helper"

class RoasControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get roas_show_url
    assert_response :success
  end

  test "should get create" do
    get roas_create_url
    assert_response :success
  end

  test "should get edit" do
    get roas_edit_url
    assert_response :success
  end

  test "should get update" do
    get roas_update_url
    assert_response :success
  end

  test "should get destroy" do
    get roas_destroy_url
    assert_response :success
  end
end
