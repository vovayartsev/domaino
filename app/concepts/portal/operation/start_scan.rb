class Portal::StartScan < Trailblazer::Operation
  include Model
  model Portal, :find

  def process(params)
    heroku_domains = HerokuApiService.get_domains(model.id)
    model.set_domains_list! heroku_domains
    model.domains.each do |domain|
      domain.checks.each do |check|
        check.scanning!
        RescanJob.perform_later(check.id)
      end
    end
  end
end
