require 'test_helper'

class StatisticTest < ActiveSupport::TestCase
  test 'should not have a statistic without an associated url' do
    statistic = Statistic.new
    assert_not statistic.save, 'saved statistic even without an associated url'
  end

  test 'should save when there is an associated url' do
    url = Url.new
    url.id = 123
    url.original_url = 'http://thisismyurl.com'
    url.slug = 'abc12'
    url.save

    statistic = Statistic.new
    statistic.url_id = url.id
    statistic.ip_address = '192.168.1.1'
    statistic.referer = 'http://someurl.com'
    assert statistic.save, 'failed to save even if there is as associated url'
  end
end
