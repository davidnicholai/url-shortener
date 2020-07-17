require 'test_helper'

class UrlsControllerTest < ActionDispatch::IntegrationTest
  test "can create a shortened url" do
    get "/urls/new"
    assert_response :success

    post "/urls",
      params: { url: { original_url: "https://thisismyurl.com" } }
    assert_response :redirect
    follow_redirect!
    assert_response :success
  end

  test "should not create a shortened url due to invalid link" do
    get "/urls/new"
    assert_response :success

    post "/urls",
      params: { url: { original_url: "foobarbaz" } }
    assert_response :bad_request
  end
end
