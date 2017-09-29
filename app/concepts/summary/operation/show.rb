require 'representable/json'

class Summary::Show < Trailblazer::Operation
  class JSON < self
    include Representer
    representer do
      include Representable::JSON
      property :status
      property :header
      property :message
    end
  end

  def process(params)
    portal = Portal.find(params[:portal_id])
    status, ttl = analyze_portal(portal)
    scope = [:jumbos, status]

    @model = OpenStruct.new(
      status: status,
      header:  I18n.t('header',  scope: scope, ttl: ttl),
      message: I18n.t('message', scope: scope, ttl: ttl)
    )
  end

  private

  def analyze_portal(portal)
    return [:not_configured, nil] if portal.domains.none?

    nearest_expiration = Check.for_portal(portal).minimum(:expiration)
    return [:na, nil] unless nearest_expiration # failed to determine expiration date

    ttl = (nearest_expiration - Date.current).to_i
    return [:expired, ttl] if ttl < portal.settings.hard_ttl
    return [:warning, ttl] if ttl < portal.settings.soft_ttl
    return [:ok, ttl]
  end
end
