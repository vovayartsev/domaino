require 'representable/json'

# TODO: isn't it too much code for a basic SHOW operation?
# Should we just find and render the model in the controller instead?
class Portal::Show < Trailblazer::Operation
  include Representer
  representer Portal::DomainsTreeRepresenter

  include Model
  model Portal, :find

  def process(params)
    # nothing to do besides just finding the model
  end

  def as_json(options={})
    self.class.representer.new(represented).as_json
  end
end
