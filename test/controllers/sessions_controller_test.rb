require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test 'user can log-in' do
    get '/login'
    assert_response :success

    post '/login',
      params: { username: 'foobar', password: 'baz' }
    follow_redirect!
    assert_response :success
  end
end
