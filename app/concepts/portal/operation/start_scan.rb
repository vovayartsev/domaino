class Portal::StartScan < Trailblazer::Operation
  def process(params)
    resource = Resource.find(params[:id])

    heroku_domains = HerokuApiService.get_domains(resource.id)
    resource.sync_heroku_domains_list! heroku_domains
    ResourceCamera.take_snapshot(resource)

    resource.domain_names.each do |domain_name|
      RescanJob.perform_later(domain_name)
    end
  end

  private

end
