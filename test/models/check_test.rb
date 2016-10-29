require 'test_helper'

class CheckTest < ActiveSupport::TestCase
  test "default status" do
    check = Check.create(domain: domains(:apple), kind: :ssl)
    assert check.scanning?
  end
end
