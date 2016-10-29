require 'test_helper'
require 'minitest/mock'

class PortalStartScanTest < ActiveSupport::TestCase
  test "updates domains list, creates checks and starts background jobs" do
    HerokuApiService.stub :get_domains, %w(domaino.com) do
      RescanJob.stub :perform_later, nil do
        portal = Portal::StartScan.(id: portals(:vova).id).model

        assert_equal %w(domaino.com), portal.domains.map(&:name)
        portal.domains.each {|d| assert d.persisted? }
        assert_equal %w(ssl dns), portal.domains.first.checks.map(&:kind)
        assert_equal 'scanning', portal.domains.first.checks.first.status
        assert_equal 2, Portal.gc_portal.domains.count
      end
    end
  end
end
