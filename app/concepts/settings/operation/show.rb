require 'representable/json'

class Settings::Show < Trailblazer::Operation
  class JSON < self
    include Representer
    representer do
      include Representable::JSON
      property :sms_recepient
      property :emails, exec_context: :decorator
      property :human_intelligence

      def emails
        (represented.additional_emails || "").split + [represented.portal.email]
      end
    end
  end

  def process(params)
    @model = Settings.where(portal_id: params[:portal_id]).first!
  end

end
