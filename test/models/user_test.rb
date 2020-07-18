require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'should save new user' do
    user = User.new
    user.username = 'foobar'
    user.password = 'baz'
    assert user.save, 'could not save user'
  end

  test 'should not save user with blank attributes' do
    user = User.new
    assert_not user.save, 'saved user even with blank attributes'
  end
end
