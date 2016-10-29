require 'representable/json'

class Portal::Show < Trailblazer::Operation
  class Redux < self
    include Representer
    representer Portal::ReduxRepresenter
    def as_json(*)
      self.class.representer.new(model).as_json
    end
  end

  include Model
  model Portal, :find

  def process(params)
    # nothing to do besides just finding the model
  end
end
