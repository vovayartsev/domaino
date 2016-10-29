require 'representable/json'

class Portal::ReduxRepresenter < Representable::Decorator
  include Representable::JSON

  property :email
  property :type, exec_context: :decorator
  collection :list, exec_context: :decorator

  private

  class CheckRepresenter < Representable::Decorator
    include Representable::JSON
    property :status
    property :expiration
  end

  # see expected results in portal_show_test.rb
  def list
    represented.domains.preload(:checks).map do |domain|
      results = domain.checks.map do |check|
        [check.kind.to_sym, CheckRepresenter.new(check).as_json]
      end
      {name: domain.name, **results.to_h}
    end
  end

  def type
    "DOMAINS_LOADED"
  end
end
