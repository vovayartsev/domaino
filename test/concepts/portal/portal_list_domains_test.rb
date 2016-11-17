require 'test_helper'

class PortalListDomainsTest < ActiveSupport::TestCase
  EXPECTED_DOMAIN = {
    name: 'google.com',
    dns: {
      status: 'scanning'
    },
    ssl: {
      status: 'expired',
    }
  }.deep_stringify_keys

  test "shows portal with domains" do
    hash = JSON.parse Portal::ListDomains::JSON.(id: portals(:vova).id).to_json
    assert_instance_of Array, hash['list']
    assert_equal EXPECTED_DOMAIN, hash['list'].first
  end
end
