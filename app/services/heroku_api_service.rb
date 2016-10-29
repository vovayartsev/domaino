class HerokuApiService
  include Singleton
  class << self
    delegate :get_domains, to: :instance
  end

  def get_domains(portal_id)
    # raise "not implemented"
    %w(google.com apple.com)
  end
end
