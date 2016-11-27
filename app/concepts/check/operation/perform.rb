class Check::Perform < Trailblazer::Operation
  include Model
  model Check, :update

  WARNING_THRESHOLD = 14 # days

  def process(params)
    result = checker.call(model.domain.name)
    model.update!(
        last_scan_at: Time.zone.now,
        status: status_from_result(result),
        error_message: result.error&.message,
        expiration: result.paid_till
    )
  end

  private

  def status_from_result(result)
    return :na if !result.available
    remaining_days = Integer(result.paid_till - Date.today)
    return :expired if remaining_days < 0
    return :warning if remaining_days < WARNING_THRESHOLD
    return :ok
  end

  def checker
    return SslValidationService.new if model.ssl?
    return DnsValidationService.new if model.dns?
  end

  def notify!
    DomainsListChannel.broadcast_to(model.portal, {})
  end
end
