require 'representable/json'

class Portal::DomainsTreeRepresenter < Representable::Decorator
  include Representable::JSON

  property :email
  property :domains, exec_context: :decorator

  private

  def domains
    [{
      name: 'google.com',
      ssl: {
        status: 'ok',
        expiration: '2017-01-01'
      },
      dns: {
        status: 'warning',
        expiration: '2016-10-01'
      }
    }]
  end
end
