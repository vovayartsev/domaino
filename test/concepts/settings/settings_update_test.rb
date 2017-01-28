require 'test_helper'

class SettingsUpdateTest < ActiveSupport::TestCase
  NEW_SETTINGS = {sms_recepient: "+79272634799"}
  BAD_SETTINGS = {additional_emails: "abra kadabra", sms_recepient: 'abra kadabra'}

  test "updates settings" do
    Settings::Update.(portal_id: portals(:vova).id, settings: NEW_SETTINGS)
    assert_equal NEW_SETTINGS[:sms_recepient], settings(:vova_settings).reload.sms_recepient
  end

  test "validates emails and SMS recepients" do
    res, operation = Settings::Update.run(portal_id: portals(:vova).id, settings: BAD_SETTINGS)
    assert_equal 2, operation.errors.count
  end
end
