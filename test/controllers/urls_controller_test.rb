require 'test_helper'

class UrlsControllerTest < ActionDispatch::IntegrationTest
  test 'non-member can create a shortened url' do
    get '/'
    assert_response :success

    post '/urls',
      params: { url: { original_url: 'https://thisismyurl.com' } }
    assert_response :redirect
    follow_redirect!
    assert_response :success
  end

  test 'should not create a shortened url due to invalid link' do
    get '/'
    assert_response :success

    post '/urls',
      params: { url: { original_url: '' } }
    follow_redirect!
    assert flash[:alert], "no flash alert"
  end
end
