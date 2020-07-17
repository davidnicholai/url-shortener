require 'test_helper'

class UrlsControllerTest < ActionDispatch::IntegrationTest
  test "can create a shortened url" do
    get "/urls/new"
    assert_response :success

    post "/urls",
      params: { url: { text: "https://thisismyurl.com" } }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select "a", "https://thisismyurl.com"
  end

  test "revisiting a generated url should not work" do
    get "/urls/Z79ap"
    assert_response :not_found
  end
end
