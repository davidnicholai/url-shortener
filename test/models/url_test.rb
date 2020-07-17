require 'test_helper'

class UrlTest < ActiveSupport::TestCase
  test "should not save url without text" do
    url = Url.new
    assert_not url.save, "saved url with empty text"
  end

  test "should not save url with invalid link" do
    url = Url.new
    url.original_url = "hello i am not a legitimate url"
    assert_not url.save, "saved url with invalid link"
  end

  test "should save url with valid link" do
    url = Url.new
    url.original_url = "http://thisismyurl.com"
    assert url.save, "could not save url with valid link"
  end
end
