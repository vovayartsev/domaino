require 'test_helper'

class DnsValidationServiceTest < ActiveSupport::TestCase
  test "valid domain" do
    result = enquire('dockhero.io')
    assert_equal true, result.available
    assert_equal true, result.paid_till > Date.today
  end

  test "invalid domain" do
    result = enquire('asdfasdfasdfasdfasdasdf2222.ru')
    assert_equal false, result.available
    assert_nil result.paid_till
  end

  private

  def enquire(tld)
    DnsValidationService.new.call(tld)
  end
end
