require 'representable/json'

class Portal::DomainsTreeRepresenter < Representable::Decorator
  include Representable::JSON

  property :email
  property :type, exec_context: :decorator
  property :list, exec_context: :decorator

  private

  def list
    [{
      name: 'google.com',
      ssl: {
        status: 'ok',
        expiration: '2017-01-02'
      },
      dns: {
        status: 'warning',
        expiration: '2016-10-03'
      }
    }]
  end

  def type
    "DOMAINS_LOADED"
  end
end
