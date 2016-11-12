require 'test_helper'

class SettingsShowTest < ActiveSupport::TestCase
  EXPECTED_RESULT = {
    sms_recepient: "+1-555-5555555"
  }.deep_stringify_keys

  test "shows portal with domains" do
    result = Settings::Show::JSON.(portal_id: portals(:vova).id).to_json
    assert_equal EXPECTED_RESULT, JSON.parse(result)
  end
end
