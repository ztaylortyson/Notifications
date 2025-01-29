require "test_helper"

class ScraperControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get scraper_home_url
    assert_response :success
  end

  test "should get get_roa" do
    get scraper_get_roa_url
    assert_response :success
  end

  test "should get read_roa" do
    get scraper_read_roa_url
    assert_response :success
  end

  test "should get list_roas" do
    get scraper_list_roas_url
    assert_response :success
  end
end
