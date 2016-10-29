require 'representable/json'

# TODO: isn't it too much code for a basic SHOW operation?
# Should we just find and render the model in the controller instead?
class Portal::Show < Trailblazer::Operation
  class Redux < self
    include Representer
    representer Portal::ReduxRepresenter
  end

  include Model
  model Portal, :find

  def process(params)
    # nothing to do besides just finding the model
  end


end
