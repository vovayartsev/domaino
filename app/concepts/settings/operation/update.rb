class Settings::Update < Trailblazer::Operation
  contract do
    property :sms_recepient # TODO: validation
    property :additional_emails # TODO: validation
    property :human_intelligence # TODO: validation
    property :deadline

    validates :additional_emails, emails_array: true
    validates :sms_recepient, sms: true
    validates :deadline, numericality: true

    def heroku_email
      model.portal.email
    end
  end

  include Model
  model Settings, :find

  def process(params)
    validate(params[:settings]) do
      contract.save
      # TODO: callbacks
      SettingsChannel.broadcast_to(model, {})
    end
  end

  private

  def find_model(params)
    Settings.where(portal_id: params[:portal_id]).first!
  end
end
