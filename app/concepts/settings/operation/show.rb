require 'representable/json'

class Settings::Show < Trailblazer::Operation
  class JSON < self
    include Representer
    representer do
      include Representable::JSON
      property :sms_recepient
    end
  end

  def process(params)
    @model = Settings.where(portal_id: params[:portal_id]).first!
  end
end
