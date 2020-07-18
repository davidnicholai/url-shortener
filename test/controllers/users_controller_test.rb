require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test 'non-member can register' do
    get '/users/new'
    assert_response :success

    post '/users',
      params: { user: { username: 'foobar', password: '1234' } }
    follow_redirect!
    assert_response :success
  end
end
