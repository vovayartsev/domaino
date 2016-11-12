module ApplicationCable
  class Channel < ActionCable::Channel::Base
    def redux_stream_for(object)
      do_transmit(yield)
      stream_for(object) { do_transmit(yield) }
    end

    private

    def do_transmit(operation)
      transmit(type: redux_type, representation: representation(operation))
    end

    def representation(operation)
      operation.class.representer.new(operation.model).as_json
    end

    def redux_type
      self.class.name
    end
  end
end
