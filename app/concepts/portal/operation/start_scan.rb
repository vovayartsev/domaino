class Portal::StartScan < Trailblazer::Operation
  include Model
  model Portal, :find

  def process(params)
    heroku_domains = HerokuApiService.get_domains(model.id)
    model.set_domains_list! heroku_domains
    run_checks_in_background!
    notify!
  end

  private

  def run_checks_in_background!
    model.domains.each do |domain|
      domain.checks.each do |check|
        check.scanning!
        RescanJob.perform_later(check.id)
      end
    end
  end

  def notify!
    PortalChannel.broadcast_to(model, {})
  end
end
