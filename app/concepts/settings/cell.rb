class Settings::Cell < Trailblazer::Cell
  include ::Cell::Slim
  include SimpleForm::ActionViewExtensions::FormHelper

  class Sms < self
  end

  class Email < self
    property :heroku_email
  end

  class Human < self
  end

  private

  def settings_path(settings)
    "/settings/current"
  end
  alias_method :reform_path, :settings_path
end
