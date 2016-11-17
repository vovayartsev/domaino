require 'representable/json'

class Portal::ListDomains < Trailblazer::Operation
  class JSON < self
    include Representer

    class CheckRepresenter < Representable::Decorator
      include Representable::JSON
      property :status
      property :expiration
    end

    representer do
      collection :list do
        property :name
        property :ssl, decorator: CheckRepresenter
        property :dns, decorator: CheckRepresenter
      end
    end
  end

  Result = Struct.new(:list)

  class ResultRow < Struct.new(:name, :ssl, :dns)
    def assign_checks(checks)
      checks.each do |check|
        send "#{check.kind}=", check
      end
    end
  end

  def process(params)
    portal = Portal.find(params[:id])
    @model = Result.new([])
    portal.domains.preload(:checks).each do |domain|
      row = ResultRow.new(domain.name)
      row.assign_checks(domain.checks)
      @model.list << row
    end
  end
end
