require 'test_helper'

class SettingsUpdateTest < ActiveSupport::TestCase
  NEW_SETTINGS = {sms_recepient: "+79272634799"}
  test "updates settings" do
    Settings::Update.(portal_id: portals(:vova).id, settings: NEW_SETTINGS)
    assert_equal NEW_SETTINGS[:sms_recepient], settings(:vova_settings).reload.sms_recepient
  end
end
