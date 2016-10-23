require 'test_helper'

class PortalTest < ActiveSupport::TestCase
  EXPECTED_DOMAIN = {
    name: 'google.com',
    ssl: {
      status: 'ok',
      expiration: '2017-01-01'
    },
    dns: {
      status: 'warning',
      expiration: '2016-10-01'
    }
  }.deep_stringify_keys

  test "shows portal with domains" do
    hash = JSON.parse Portal::Show.(id: portals(:vova).id).to_json

    assert_equal 'vovayartsev@gmail.com', hash['email']
    assert_instance_of Array, hash['domains']
    assert_equal EXPECTED_DOMAIN, hash['domains'].first
  end
end
