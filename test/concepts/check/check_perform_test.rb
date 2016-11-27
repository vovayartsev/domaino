require 'test_helper'

class CheckPerformTest < ActiveSupport::TestCase
  test "ssl check" do
    ssl_result = SslValidationService::Result.new(true, expected_expiration, nil)
    SslValidationService.any_instance.expects(:call).with('google.com').once.returns(ssl_result)
    check = checks(:two)
    assert check.ssl?
    result = Check::Perform.({id: check.id})
    check.reload
    assert check.ok?
    assert_equal expected_expiration, check.expiration
    assert_equal nil, check.error_message
  end

  test "dns check" do
    dns_result = DnsValidationService::Result.new(true, expected_expiration, nil)
    DnsValidationService.any_instance.expects(:call).with('google.com').once.returns(dns_result)
    check = checks(:one)
    assert check.dns?
    result = Check::Perform.({id: check.id})
    check.reload
    assert check.ok?
    assert_equal expected_expiration, check.expiration
    assert_equal nil, check.error_message
  end

  private

  def expected_expiration
    Date.today + 300
  end
end
