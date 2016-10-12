require 'representable/json'

# TODO: isn't it too much code for a basic SHOW operation?
# Should we just find and render the model in the controller instead?
class Portal::Show < Trailblazer::Operation
  extend Representer::DSL
  include Representer::Rendering
  representer Portal::DomainsTreeRepresenter

  # include Responder

  include Model
  model Portal, :find

  def process(params)
    # nothing to do besides just finding the model
  end
end
