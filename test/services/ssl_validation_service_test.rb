require 'test_helper'

class SslValidationServiceTest < ActiveSupport::TestCase
  test "valid domain" do
    result = enquire('ya.ru')
    assert_equal true, result.valid
    assert_equal true, result.paid_till > Date.today
  end

  test "invalid domain" do
    result = enquire('asdfasdfasdfasdfasdasdf2222.ru')
    assert_equal false, result.valid
    assert_equal nil, result.paid_till
  end

  private

  def enquire(tld)
    SslValidationService.new.call(tld)
  end
end
